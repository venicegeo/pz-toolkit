#!/bin/bash
#Auth: Sonny Saniev
#Desc: Toolkit to manage piazza locally.

if [ -z "$LOCAL_PIAZZA_REPO_PATH" ]; then
echo "Please create LOCAL_PIAZZA_REPO_PATH env variable and point to an empty or existing directory containing piazza repositories."
exit 1
fi

#echo current path is
#pwd
if [ ! -d "$LOCAL_PIAZZA_REPO_PATH" ]; then
echo FOLDER DOES NOT EXIST............
fi
echo
echo
read -r -d '' WELCOME << EOM
==============================================================
::::::::: :::::::::     :::     ::::::::: ::::::::     :::
:+:    :+:   :+:      :+: :+:        :+:       :+:   :+: :+:
+:+    +:+   +:+     +:+   +:+      +:+       +:+   +:+   +:+
+#++:++#+    +#+    +#++:++#++:    +#+       +#+   +#++:++#++:
+#+          +#+    +#+     +#+   +#+       +#+    +#+     +#+
#+#          #+#    #+#     #+#  #+#       #+#     #+#     #+#
###       ######### ###     ### ########  ######## ###     ###
==============================================================

 --PIAZZA APPS----              | --REQUIRED SERVICES----
  1. Clone/Update All Projects  |  5. Stop All Services
  2. Compile All Projects       |  6. Destroy All Services
  3. Start All Piazza Services  |  7. List All Services
  4. Start All Piazza Projects  |

 -------------------------------------------------------------
   
 --MICROMANAGEMENT----
  a. Compile Individual Piazza Projects
  b. Start/Stop Individual Piazza Services
  c. Start Indivial Piazza Projects
   
 -------------------------------------------------------------

 
 *Type "h" for help, type "q" to quit
______________________________________________________________
EOM

echo "$WELCOME"

while true
do
        read -r input
        case $input in
                0)
                        # TODO
                        echo
                        echo
                        echo UNDER CONSTUCTION...
                        echo
                        sleep 3
						echo "$WELCOME"
						;;
                1)
                        echo
                        echo
                        echo Cloning piazza repositories!
                        echo
                        cd $LOCAL_PIAZZA_REPO_PATH
                        pwd
                        git clone https://github.com/venicegeo/pz-gateway.git
                        git clone https://github.com/venicegeo/pz-ingest.git
                        git clone https://github.com/venicegeo/pz-access.git
                        git clone https://github.com/venicegeo/pz-jobmanager.git
                        git clone https://github.com/venicegeo/pz-search-query.git
                        git clone https://github.com/venicegeo/pz-search-metadata-ingest.git
                        git clone https://github.com/venicegeo/pz-servicecontroller.git
                        git clone https://github.com/venicegeo/kafka-devbox.git
						git clone https://github.com/venicegeo/pz-logger.git
						git clone https://github.com/venicegeo/pz-uuidgen.git
						git clone https://github.com/venicegeo/pz-workflow.git
						git clone https://github.com/venicegeo/pz-jobcommon.git
                        echo
                        cd pz-gateway
                        echo pz-gateway update
                        git pull
                        echo
                        cd ../pz-access
                        echo pz-access update
                        git pull
                        echo
                        cd ../pz-ingest
                        echo pz-ingest update
                        git pull
                        echo
                        cd ../pz-jobmanager
                        echo pz-jobmanager update
                        git pull
                        echo
                        cd ../pz-search-metadata-ingest
                        echo pz-search-metadata-ingest update
                        git pull
                        echo
                        cd ../pz-search-query
                        echo pz-search-query update
                        git pull
                        echo
                        cd ../pz-servicecontroller
                        echo pz-servicecontroller update
                        git pull
                        echo
                        cd ../kafka-devbox
                        echo kafka-devbox update
                        git pull
                        echo
						cd ../pz-workflow
						echo pz-workflow update
						git pull
						echo
						cd ../pz-uuidgen
						echo pz-uuidgen update
						git pull
						echo
						cd ../pz-logger
						echo pz-logger update
						git pull
						echo
						cd ../pz-jobcommon
						echo pz-jobcommon update
						git pull
                        echo
                        echo Update Complete.
                        echo
                        echo
                        echo "$WELCOME"
                        ;;
                2)
                        echo
                        echo
                        echo Building piazza projects
                        cd $LOCAL_PIAZZA_REPO_PATH
						echo ==========Building pz-jobcommon==========
						cd pz-jobcommon 
						mvn clean install
						echo
						echo
						echo
						echo
						sleep 2
                        echo ==========Building pz-gateway==========
                        cd ../pz-gateway
                        mvn clean install
                        echo
                        echo
                        echo
                        echo
						sleep 2
                        echo ==========Building pz-access==========
                        cd ../pz-access
                        mvn clean install
                        echo
                        echo
                        echo
                        echo
						sleep 2
                        echo ==========Building pz-ingest==========
                        cd ../pz-ingest
                        mvn clean install
                        echo
                        echo
                        echo
                        echo
						sleep 2
                        echo ==========Building pz-search-query==========
                        cd ../pz-search-query
                        mvn clean install
                        echo
                        echo
                        echo
                        echo
                        sleep 2
                        echo ==========Building pz-jobmanager==========
                        cd ../pz-jobmanager
                        mvn clean install
                        echo
                        echo
                        echo
                        echo
						sleep 2
                        echo ==========Building pz-search-metadata-ingest==========
                        cd ../pz-search-metadata-ingest
                        mvn clean install
                        echo
                        echo
                        echo
                        echo
						sleep 2
                        echo ==========Building pz-servicecontroller==========
                        cd ../pz-servicecontroller/mainServiceController
                        mvn clean install
                        echo
                        echo
                        echo "$WELCOME"
                        ;;
                a)
                        echo
                        echo
						echo
						echo --BUILD INDIVIDUAL PIAZZA PROJECTS--
						echo ====================================
						echo 0. "<<" GO BACK 
						echo
						echo 1. BUILD pz-gateway
						echo 2. BUILD pz-access
						echo 3. BUILD pz-ingest
						echo 4. BUILD pz-search-query
						echo 5. BUILD pz-jobmanager
						echo 6. BUILD pz-search-metadata-ingest
						echo 7. BUILD pz-servicecontroller
						echo 8. BUILD pz-jobcommon
						echo
						echo ________________________________
						read -r buildappsselection
						echo
						echo
						echo $buildappsselection
						case $buildappsselection in
						1)
							cd $LOCAL_PIAZZA_REPO_PATH
							echo
							echo
							echo ==========Building pz-gateway==========
							cd pz-gateway
							mvn clean install
							echo
							echo
							echo
							echo
							;;
						2)
							cd $LOCAL_PIAZZA_REPO_PATH
							echo
							echo
							echo ==========Building pz-access==========
							cd pz-access
							mvn clean install
							echo
							echo
							echo
							echo
							;;
						3)
							cd $LOCAL_PIAZZA_REPO_PATH
							echo
							echo
							echo ==========Building pz-ingest==========
							cd pz-ingest
							mvn clean install
							echo
							echo
							echo
							echo
							;;
						4)
							cd $LOCAL_PIAZZA_REPO_PATH
							echo
							echo
							echo ==========Building pz-search-query==========
							cd pz-search-query
							mvn clean install
							echo
							echo
							echo
							echo
							;;
						5)
							cd $LOCAL_PIAZZA_REPO_PATH
							echo
							echo
							echo ==========Building pz-jobmanager==========
							cd pz-jobmanager
							mvn clean install
							echo
							echo
							echo
							echo
							;;
						6)
							cd $LOCAL_PIAZZA_REPO_PATH
							echo
							echo
							echo ==========Building pz-search-metadata-ingest==========
							cd pz-search-metadata-ingest
							mvn clean install
							echo
							echo
							echo
							echo
							;;
						7)
							cd $LOCAL_PIAZZA_REPO_PATH
							echo
							echo
							echo ==========Building pz-servicecontroller==========
							cd pz-servicecontroller/mainServiceController
							mvn clean install
							echo
							echo
							;;
						8)
							cd $LOCAL_PIAZZA_REPO_PATH
							echo
							echo
							echo ==========Building pz-jobcommon==========
							cd pz-jobcommon 
							mvn clean install
							echo
							echo
							echo
							echo
							;;
						0)
							echo
							;;
						esac
                        echo "$WELCOME"
                        ;;
                3)
                        echo
                        echo
                        if ! vagrant plugin list | grep -q "vagrant-hostsupdater"
                        then
                            echo vagrant-hostsupdater plugin is missing, trying ot install.
                            vagrant plugin install vagrant-hostsupdater
                        fi
                        echo
						# below line should start all on a new terminal
						osascript -e "tell app \"Terminal\" to do script \"echo ===========Starting jobdb mongoDB instance=========== && cd $LOCAL_PIAZZA_REPO_PATH/pz-jobmanager/config && vagrant up jobdb && echo && echo && echo ===========Starting GeoServer=========== && cd ../../pz-access/config && vagrant up geoserver && echo && echo && echo && echo ===========Starting PostGIS=========== && cd ../../pz-ingest/config && vagrant up postgis && echo && echo && echo && echo ===========Starting ElasticSearch=========== && cd ../../pz-search-metadata-ingest/config && vagrant up search && echo && echo && echo  && echo ===========Starting Kafka boxes=========== && cd ../../kafka-devbox && vagrant up zk && vagrant up ca && vagrant up kafka && echo && echo && echo && echo ===========Starting Logger=========== && cd ../pz-logger/config && vagrant up && vagrant reload && echo && echo && echo && echo ===========Starting pz-uuidgen=========== && cd ../../pz-uuidgen/config && vagrant up && vagrant reload && echo && echo && echo && echo ===========Starting pz-workflow=========== && cd ../../pz-workflow/config && vagrant up && vagrant reload && echo && echo && vagrant global-status --prune && echo && echo\""
                        echo "$WELCOME"
                        ;;
                b)
                        echo
                        echo
						echo
						echo --START/STOP/RESTART INDIVIDUAL PIAZZA SERVICES--
						echo =================================================
						echo 0. "<<" GO BACK 
						echo
						echo 1. START MongoDB
						echo 2. START GeoServer
						echo 3. START PostGIS
						echo 4. START ElasticSearch
						echo 5. START Kafka
						echo 6. START Logger
						echo 7. START UuidGen
						echo 8. START Workflow
						echo
						echo ________________________________
						read -r startappsselection
						echo
						echo
						echo $startappsselection
						case $startappsselection in
						1)
							echo
							echo 0. "<<" GO BACK 
							echo
							echo 1. START MongoDB
							echo 2. STOP MongoDB
							echo 3. RESTART MongoDB
							echo
							read -r servicemicromanagement
							echo
							echo
							echo $servicemicromanagement
							case $servicemicromanagement in
							1)
								echo Starting MongoDB
								cd $LOCAL_PIAZZA_REPO_PATH/pz-jobmanager/config
								vagrant up jobdb
								vagrant status
								;;
							2)
								echo Stopping MongoDB
								cd $LOCAL_PIAZZA_REPO_PATH/pz-jobmanager/config
								vagrant halt jobdb
								vagrant status
								;;
							3)
								echo Restarting MongoDB
								cd $LOCAL_PIAZZA_REPO_PATH/pz-jobmanager/config
								vagrant reload jobdb
								vagrant status
								;;
							esac
							;;
						2)
							echo
							echo 0. "<<" GO BACK 
							echo
							echo 1. START GeoServer
							echo 2. STOP GeoServer
							echo 3. RESTART GeoServer
							echo
							read -r servicemicromanagement
							echo
							echo
							echo $servicemicromanagement
							case $servicemicromanagement in
							1)
								echo Starting GeoServer
								cd $LOCAL_PIAZZA_REPO_PATH/pz-access/config
								vagrant up geoserver
								vagrant status
								;;
							2)
								echo Stopping GeoServer
								cd $LOCAL_PIAZZA_REPO_PATH/pz-access/config
								vagrant halt geoserver
								vagrant status
								;;
							3)
								echo Restarting GeoServer
								cd $LOCAL_PIAZZA_REPO_PATH/pz-access/config
								vagrant reload geoserver
								vagrant status
								;;
							esac
							;;
						3)
							echo
							echo 0. "<<" GO BACK 
							echo
							echo 1. START PostGIS
							echo 2. STOP PostGIS
							echo 3. RESTART PostGIS
							echo
							read -r servicemicromanagement
							echo
							echo
							echo $servicemicromanagement
							case $servicemicromanagement in
							1)
								echo Starting PostGIS
								cd $LOCAL_PIAZZA_REPO_PATH/pz-ingest/config
								vagrant up postgis
								vagrant status
								;;
							2)
								echo Stopping PostGIS
								cd $LOCAL_PIAZZA_REPO_PATH/pz-ingest/config
								vagrant halt postgis
								vagrant status
								;;
							3)
								echo Restarting PostGIS
								cd $LOCAL_PIAZZA_REPO_PATH/pz-ingest/config
								vagrant reload postgis
								vagrant status
								;;
							esac
							;;
						4)
							echo
							echo 0. "<<" GO BACK 
							echo
							echo 1. START ElasticSearch
							echo 2. STOP ElasticSearch
							echo 3. RESTART ElasticSearch
							echo
							read -r servicemicromanagement
							echo
							echo
							echo $servicemicromanagement
							case $servicemicromanagement in
							1)
								echo Starting ElasticSearch
								cd $LOCAL_PIAZZA_REPO_PATH/pz-search-metadata-ingest/config
								vagrant up search
								vagrant status
								;;
							2)
								echo Stopping ElasticSearch
								cd $LOCAL_PIAZZA_REPO_PATH/pz-search-metadata-ingest/config
								vagrant halt search
								vagrant status
								;;
							3)
								echo Restarting ElasticSearch
								cd $LOCAL_PIAZZA_REPO_PATH/pz-search-metadata-ingest/config
								vagrant reload search
								vagrant status
								;;
							esac
							;;
						5)
							echo
							echo 0. "<<" GO BACK 
							echo
							echo 1. START Kafka
							echo 2. STOP Kafka
							echo 3. RESTART Kafka
							echo ----------------
							echo 4. START Zk
							echo 5. STOP Zk
							echo 6. RESTART Zk
							echo ----------------
							echo 7. START Ca
							echo 8. STOP Ca
							echo 9. RESTART Ca
							echo ________________
							echo
							read -r servicemicromanagement
							echo
							echo
							echo $servicemicromanagement
							case $servicemicromanagement in
							1)
								echo Starting ElasticSearch
								cd $LOCAL_PIAZZA_REPO_PATH/kafka-devbox
								vagrant up kafka
								vagrant status
								;;
							2)
								echo Stopping ElasticSearch
								cd $LOCAL_PIAZZA_REPO_PATH/kafka-devbox
								vagrant suspend kafka
								vagrant status
								;;
							3)
								echo Restarting ElasticSearch
								cd $LOCAL_PIAZZA_REPO_PATH/kafka-devbox
								vagrant reload kafka
								vagrant status
								;;
							4)
								echo Starting ElasticSearch
								cd $LOCAL_PIAZZA_REPO_PATH/kafka-devbox
								vagrant up zk
								vagrant status
								;;
							5)
								echo Stopping ElasticSearch
								cd $LOCAL_PIAZZA_REPO_PATH/kafka-devbox
								vagrant suspend zk
								vagrant status
								;;
							6)
								echo Restarting ElasticSearch
								cd $LOCAL_PIAZZA_REPO_PATH/kafka-devbox
								vagrant reload zk
								vagrant status
								;;
							7)
								echo Starting ElasticSearch
								cd $LOCAL_PIAZZA_REPO_PATH/kafka-devbox
								vagrant up ca
								vagrant status
								;;
							8)
								echo Stopping ElasticSearch
								cd $LOCAL_PIAZZA_REPO_PATH/kafka-devbox
								vagrant suspend ca
								vagrant status
								;;
							9)
								echo Restarting ElasticSearch
								cd $LOCAL_PIAZZA_REPO_PATH/kafka-devbox
								vagrant reload ca
								vagrant status
								;;
							esac
							;;
						6)
							echo
							osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH/pz-logger/config && vagrant up && vagrant global-status --prune && echo && echo\""
							;;
						7)
							echo
							osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH/pz-uuidgen/config && vagrant up && echo && vagrant global-status --prune && echo && echo\""
							;;	
						8)
							echo
							osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH/pz-workflow/config && vagrant up && echo && echo && vagrant global-status --prune && echo && echo\""
							;;	
						0)
							echo
							;;
						esac
                        echo "$WELCOME"
                        ;;
                4)
                        echo
                        echo
                        echo starting all piazza apps...
                        osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-gateway... && cd pz-gateway && java -jar target/piazza-gateway-0.1.0.jar --access.prefix=localhost --jobmanager.url=http://localhost:8083 --access.url=http://localhost:8085 --ingest.url=http://localhost:8084 --servicecontroller.url=http://localhost:8088 --search.url=http://localhost:8581 --logger.url=http://192.168.46.46:14600 --uuid.url=http://192.168.48.48:14800 --workflow.url=http://192.168.50.50:14400 \""
                        osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-ingest... && cd pz-ingest && java -jar target/piazza-ingest-0.1.0.jar --vcap.services.pz-blobstore.credentials.access_key_id=${BLOBSTORE_ACCESS_KEY} --vcap.services.pz-blobstore.credentials.secret_access_key=${BLOBSTORE_SECRET_ACCESS_KEY} --search.url=http://192.168.44.44:9200 --logger.url=http://192.168.46.46:14600 --uuid.url=http://192.168.48.48:14800 --workflow.url=http://192.168.50.50:14400 \""
                        osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-access... && cd pz-access && java -jar target/piazza-access-0.1.0.jar --vcap.services.pz-blobstore.credentials.access_key_id=${BLOBSTORE_ACCESS_KEY} --vcap.services.pz-blobstore.credentials.secret_access_key=${BLOBSTORE_SECRET_ACCESS_KEY} --logger.url=http://192.168.46.46:14600 --uuid.url=http://192.168.48.48:14800 \""
                        osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-jobmanager... && cd pz-jobmanager &&  java -jar target/piazza-jobmanager-0.1.0.jar --logger.url=http://192.168.46.46:14600 --uuid.url=http://192.168.48.48:14800 \""
                        osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-search-metadata-ingest... && cd pz-search-metadata-ingest && java -jar target/pz-search-metadata-ingest-0.0.1-SNAPSHOT.jar --logger.url=http://192.168.46.46:14600 \""
                        osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-search-query... && cd pz-search-query && java -jar target/pz-search-query-0.0.1-SNAPSHOT.jar --logger.url=http://192.168.46.46:14600 \""
                        osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-servicecontroller... && cd pz-servicecontroller && java -jar mainServiceController/target/piazzaServiceController-1.0.0.jar --workflow.url=http://192.168.50.50:14400 --logger.url=http://192.168.46.46:14600 --uuid.url=http://192.168.48.48:14800 --search.protocol=http --search.prefix=localhost --search.port=8581 --metadata.ingest.protocol=http --metadata.ingest.prefix=localhost --metadata.ingest.port=8580 \""
                        osascript -e "tell app \"Terminal\" to do script \"echo trying to run logger && cd $LOCAL_PIAZZA_REPO_PATH && pz-logger-startup/logger_startup.sh\""
                        sleep 2
                        osascript -e "tell app \"Terminal\" to do script \"echo trying to run uuidgen && cd $LOCAL_PIAZZA_REPO_PATH && pz-uuidgen-startup/uuidgen_startup.sh\""
                        sleep 2
                        osascript -e "tell app \"Terminal\" to do script \"echo trying to run workflow && cd $LOCAL_PIAZZA_REPO_PATH && pz-workflow-startup/workflow_startup.sh\""
                        echo
                        echo
                        echo
                        echo "$WELCOME"
                        ;;
                c)
                        echo
                        echo
						echo
						echo --START INDIVIDUAL PIAZZA APPS--
						echo ================================
						echo 0. "<<" GO BACK 
						echo
						echo 1.  START pz-gateway
						echo 2.  START pz-ingest
						echo 3.  START pz-access
						echo 4.  START pz-jobmanager
						echo 5.  START pz-search-metadata-ingest
						echo 6.  START pz-search-query
						echo 7.  START pz-servicecontroller
                        echo 8.  START pz-logger
                        echo 9.  START pz-uuidgen
                        echo 10. START pz-workflow
						echo
						echo ________________________________
						read -r startappsselection
						echo
						echo
						echo $startappsselection
						case $startappsselection in
						1)
							echo
							osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-gateway... && cd pz-gateway && java -jar target/piazza-gateway-0.1.0.jar --access.prefix=localhost --jobmanager.url=http://localhost:8083 --access.url=http://localhost:8085 --ingest.url=http://localhost:8084 --servicecontroller.url=http://localhost:8088 --search.url=http://localhost:8581 --logger.url=http://192.168.46.46:14600 --uuid.url=http://192.168.48.48:14800 --workflow.url=http://192.168.50.50:14400 \""
							;;
						2)
							echo
							osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-ingest... && cd pz-ingest && java -jar target/piazza-ingest-0.1.0.jar --vcap.services.pz-blobstore.credentials.access_key_id=${BLOBSTORE_ACCESS_KEY} --vcap.services.pz-blobstore.credentials.secret_access_key=${BLOBSTORE_SECRET_ACCESS_KEY} --search.url=http://192.168.44.44:9200 --logger.url=http://192.168.46.46:14600 --uuid.url=http://192.168.48.48:14800 --workflow.url=http://192.168.50.50:14400 \""
							;;
						3)
							echo
							osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-access... && cd pz-access && java -jar target/piazza-access-0.1.0.jar --vcap.services.pz-blobstore.credentials.access_key_id=${BLOBSTORE_ACCESS_KEY} --vcap.services.pz-blobstore.credentials.secret_access_key=${BLOBSTORE_SECRET_ACCESS_KEY} --logger.url=http://192.168.46.46:14600 --uuid.url=http://192.168.48.48:14800 \""
							;;
						4)
							echo
							osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-jobmanager... && cd pz-jobmanager &&  java -jar target/piazza-jobmanager-0.1.0.jar --logger.url=http://192.168.46.46:14600 --uuid.url=http://192.168.48.48:14800 \""
							;;
						5)
							echo
							osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-search-metadata-ingest... && cd pz-search-metadata-ingest && java -jar target/pz-search-metadata-ingest-0.0.1-SNAPSHOT.jar --logger.url=http://192.168.46.46:14600 \""
							;;
						6)
							echo
							osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-search-query... && cd pz-search-query && java -jar target/pz-search-query-0.0.1-SNAPSHOT.jar --logger.url=http://192.168.46.46:14600 \""
							;;
						7)
							echo
							osascript -e "tell app \"Terminal\" to do script \"cd $LOCAL_PIAZZA_REPO_PATH && echo Starting pz-servicecontroller... && cd pz-servicecontroller && java -jar mainServiceController/target/piazzaServiceController-1.0.0.jar --workflow.url=http://192.168.50.50:14400 --logger.url=http://192.168.46.46:14600 --uuid.url=http://192.168.48.48:14800 --search.protocol=http --search.prefix=localhost --search.port=8581 --metadata.ingest.protocol=http --metadata.ingest.prefix=localhost --metadata.ingest.port=8580 \""
							;;
                        8)
                            echo
                            # start new terminal and do all the steps there.
							osascript -e "tell app \"Terminal\" to do script \"export GOPATH=$LOCAL_PIAZZA_REPO_PATH/pz-logger/appbuild && export VCAP_SERVICES='{\"user-provided\":[{\"credentials\":{\"host\":\"192.168.44.44:9200\",\"hostname\":\"192.168.44.44\",\"port\":\"9200\"},\"label\":\"user-provided\",\"name\":\"pz-elasticsearch\",\"syslog_drain_url\":\"\",\"tags\":[]}]}' \""

#osascript -e "tell app \"Terminal\" to do script \"export GOPATH=$LOCAL_PIAZZA_REPO_PATH/pz-logger/appbuild && export VCAP_SERVICES='{\"user-provided\":[{\"credentials\":{\"host\":\"192.168.44.44:9200\",\"hostname\":\"192.168.44.44\",\"port\":\"9200\"},\"label\":\"user-provided\",\"name\":\"pz-elasticsearch\",\"syslog_drain_url\":\"\",\"tags\":[]}]}' && export PORT=14600 && export VCAP_APPLICATION='{\"application_id\": \"14fca253-8081-402e-abf5-8fd40ddda81f\",\"application_name\": \"pz-logger\","application_uris\": [\"pz-logger.int.geointservices.io\"],\"application_version\": \"5f0ee99-q252c-4f8d-b241-bc3e22534afc\",\"limits\": {\"disk\": 1024,\"fds\": 16384,\"mem\": 512},\"name\": \"pz-logger\",\"space_id\": \"d65a0987-df00-4d69-a50b-657e52cb2f8e\",\"space_name\": \"simulator-stage\",\"uris\": [\"pz-logger.int.geointservices.io\"],\"users\": null,\"version\": \"5f0ee99d-252c-4f8d-b241-bc3e22534afc\"}' && cd $GOPATH && go get github.com/venicegeo/pz-logger && go install github.com/venicegeo/pz-logger && $GOPATH/bin/pz-logger \""
                            ;;
						0)
							echo
							;;
						esac
                        echo "$WELCOME"
                        ;;
                5)
                        echo
                        echo
                        echo ===========Stopping Jobdb MongoDB===========
                        cd $LOCAL_PIAZZA_REPO_PATH/pz-jobmanager/config
                        vagrant halt jobdb
                        echo
                        echo
                        echo
                        echo ===========Stopping GeoServer===========
                        cd ../../pz-access/config
                        vagrant halt geoserver
                        echo
                        echo
                        echo
                        echo ===========Stopping PostGIS===========
                        cd ../../pz-ingest/config
                        vagrant halt postgis
                        echo
                        echo
                        echo
                        echo ===========Suspending Kafka Boxes===========
                        cd ../../kafka-devbox
                        vagrant suspend kafka
                        vagrant suspend ca
                        vagrant suspend zk
						echo
						echo
						echo
						echo ===========Stopping pz-workflow===========
						cd ../pz-workflow/config
						vagrant halt
                        echo
                        echo
                        echo
						echo ===========Stopping pz-uuidgen===========
						cd ../../pz-uuidgen/config
						vagrant halt
                        echo
                        echo
                        echo
						echo ===========Stopping Logger===========
						cd ../../pz-logger/config
						vagrant halt
                        echo
                        echo
                        echo
                        echo ===========Stopping ElasticSearch===========
                        cd ../../pz-search-metadata-ingest/config
                        vagrant halt search
						echo
						echo
						echo
                        vagrant global-status --prune
                        echo
                        echo
                        echo
                        echo "$WELCOME"
                        ;;
                6)
                        echo
                        echo ===========Destroying jobdb mongoDB instance===========
                        cd $LOCAL_PIAZZA_REPO_PATH/pz-jobmanager/config
                        vagrant destroy -f jobdb
                        vagrant status
                        echo
                        echo
                        echo
                        echo ===========Destroying GeoServer============
                        cd ../../pz-access/config
                        vagrant destroy -f geoserver
                        vagrant status
                        echo
                        echo
                        echo
                        echo ===========Destroying PostGIS===========
                        cd ../../pz-ingest/config
                        vagrant destroy -f postgis
                        vagrant status
                        echo
                        echo
                        echo
                        echo ===========Destroying Kafka boxes===========
                        cd ../../kafka-devbox
                        vagrant destroy -f kafka
                        vagrant destroy -f ca
                        vagrant destroy -f zk
						echo
						echo
						echo
						echo ===========Destroying pz-workflow===========
						cd ../pz-workflow/config
						vagrant destroy -f workflow
                        echo
                        echo
                        echo
						echo ===========Destroying pz-uuidgen===========
						cd ../../pz-uuidgen/config
						vagrant destroy -f uuid
                        echo
                        echo
                        echo
						echo ===========Destroying Logger===========
						cd ../../pz-logger/config
						vagrant destroy -f logger
                        echo
                        echo
                        echo
                        echo ===========Destroying ElasticSearch===========
                        cd ../../pz-search-metadata-ingest/config
                        vagrant destroy -f search
                        vagrant global-status
                        echo
                        echo
                        echo
                        echo "$WELCOME"
                        ;;
                7)
                        echo
                        echo List of local VMs:
                        vagrant global-status
                        echo
                        echo
                        echo
                        echo "$WELCOME"
                        ;;
                h)
                        echo
                        echo
						echo Following must be installed on the system: 
						echo ------------------------------------------ 
						echo -Vagrant: https://www.vagrantup.com/ 
						echo -Oracle VM VirtualBox 5.0.10: https://www.virtualbox.org/ 
						echo -Maven 3.3.x: https://maven.apache.org/ 
						echo -Java jdk1.8.x from http://www.oracle.com 
						echo
						echo
						echo Following environment variables should be set: 
						echo ----------------------------------------------
						echo JAVA_HOME Ex: export JAVA_HOME=C:\Program Files\Java\jdk1.8.0_101
                        echo
                        echo Amazon web services access keys:
                        echo    export BLOBSTORE_ACCESS_KEY=abc
                        echo    export BLOBSTORE_SECRET_ACCESS_KEY=abcd
                        echo
						echo You may also set the LOCAL_PIAZZA_REPO_PATH environment variable
						echo    to point to preferred local directory containing existing repositories
						echo
                        echo To persist the env variables, please add them to ~/.bash_profile, re-login.
						echo
						echo You may also need to add settings.xml with following content to .m2 folder for access to nexus:
						echo	""\<settings\>
						echo	"  "\<servers\>
						echo	"    "\<server\>
						echo	"      "\<id\>nexus\</id\>
						echo	"      "\<username\>username\</username\>
						echo	"      "\<password\>password\</password\>
						echo	"    "\</server\>
						echo	"  "\</servers\>
						echo	""\</settings\>
                        echo
						echo
						echo Piazza Toolkit steps accomplish the following:
						echo "    "STEP 1: Will clone/pull repositories using git to a folder specified in LOCAL_PIAZZA_REPO_PATH environment variable.
						echo "    "STEP 2: Builds all cloned piazza repositories with maven. Maven must be installed and set in PATH.
						echo "    "STEP 3: Starts all required services MongoDB/ElasticSearch/PostGIS/GeoServer/Kafka/Logger/UUIDGEN/Workflow in individual vagrant managed local VMs.
						echo "    "STEP 4: Starts all java piazza apps locally on a new command/terminal window. Console output can be used for debugging purposes. Invididual app can be killed and restarted manually.
						echo "    "STEP 5: Gracefully stops local running service VMs MongoDB/ElasticSearch/PostGIS/GeoServer/Kafka/Logger/UUIDGEN/Workflow. Must be done before shutting down developer machine.
						echo "    "STEP 6: Destroys all local service VMs MongoDB/ElasticSearch/PostGIS/GeoServer/Kafka/Logger/UUIDGEN/Workflow.
						echo "    "STEP 7: Lists and prunes all global vagrant boxes existing on the developers host machine.
						echo "    "STEP a: This option allows to compile specific piazza apps.
						echo "    "STEP b: This option allows to start/restart specific service VMs, a lot quicker.
						echo "    "STEP c: This option allows to start specific piazza apps.
                        echo
                        sleep 1
                        echo "$WELCOME"
                        ;;
                q)
                        exit 0
                        ;;
                *)
                        echo "$WELCOME"
                        ;;
        esac
done
