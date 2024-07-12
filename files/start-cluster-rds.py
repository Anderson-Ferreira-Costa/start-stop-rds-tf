import boto3
rds = boto3.client('rds')

def lambda_handler(event, context):

    #Start DB Instances
    dbs = rds.describe_db_clusters()
    for db in dbs['DBClusters']:
        #Check if DB instance stopped. Start it if eligible.
        if (db['Status'] == 'stopped'):
            doNotStart=1
            try:
                GetTags=rds.list_tags_for_resource(ResourceName=db['DBClusterArn'])['TagList']
                for tags in GetTags:
                #if tag "autostart=yes" is set for instance, start it
                    if(tags['Key'] == 'autostart' and tags['Value'] == 'yes'):
                        result = rds.start_db_cluster(DBClusterIdentifier=db['DBClusterIdentifier'])
                        print ("Starting instance: {0}.".format(db['DBClusterIdentifier']))
                if(doNotStart == 1):
                    doNotStart=1
            except Exception as e:
                print ("Cannot start instance {0}.".format(db['DBClusterIdentifier']))
                print(e)
                
if __name__ == "__main__":
    lambda_handler(None, None)