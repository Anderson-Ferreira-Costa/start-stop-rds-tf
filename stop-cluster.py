import boto3
rds = boto3.client('rds')

def lambda_handler(event, context):

    #Stop DB instances
    dbs = rds.describe_db_clusters()
    for db in dbs['DBClusters']:
        #Check if DB instance is not already stopped
        if (db['Status'] == 'available'):
            DoNotStop=1
            try:
                GetTags=rds.list_tags_for_resource(ResourceName=db['DBClusterArn'])['TagList']
                for tags in GetTags:
                #if tag "autostop=yes" is set for instance, stop it
                    if(tags['Key'] == 'autostop' and tags['Value'] == 'yes'):
                        result = rds.stop_db_cluster(DBClusterIdentifier=db['DBClusterIdentifier'])
                        print ("Stopping instance: {0}.".format(db['DBClusterIdentifier']))
                if(DoNotStop == 1):
                    DoNotStop=1
            except Exception as e:
                print ("Cannot stop instance {0}.".format(db['DBClusterIdentifier']))
                print(e)
                
if __name__ == "__main__":
    lambda_handler(None, None)