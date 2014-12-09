#!/bin/bash
echo '=========================================================';
echo 'wso2 carbon builder version 0.0.1';
echo 'src at https://github.com/rzrbld/bashStudio';
echo '-------------------[ Start bulding ]---------------------';
echo '';
PATHTOPROJECT=`echo '/cygdrive/'$1 | sed 's/\\\/\//g;s/\://g;s/src//g;'`;
echo 'Mapped path to the project: '$PATHTOPROJECT;
CARNAME=`echo $PATHTOPROJECT | awk -F'/[^/]*$' '{print $1}' | awk 'BEGIN { RS = "/" }; END {print $1}'`;
echo 'Detected name of project: '$CARNAME;
CARVERSION='0.0.'$(find $PATHTOPROJECT -mindepth 1 -maxdepth 1 -type d -path '*CARFile*' | wc -l); 
echo 'Detected carbon app version: '$CARVERSION;
echo '';
echo '------------------[ Builder output ]---------------------';
echo '';
CURRENTPATH=`pwd`;
cd $PATHTOPROJECT;
mkdir 'CARFile_'$CARVERSION
echo '<?xml version="1.0" encoding="UTF-8"?><artifacts>' > 'CARFile_'$CARVERSION/artifacts.xml
echo '<artifact name="'$CARNAME'" version="'$CARVERSION'" type="carbon/application">' >> 'CARFile_'$CARVERSION/artifacts.xml
for D in `find . -name '*.xml' ! -name 'pom.xml' ! -name 'artifact.xml' ! -name 'artifacts.xml' ! -path '*CARFile*' -o -name '*.dbs' ! -path '*CARFile*'`
do
	#Get full filename
	echo 'add:'$D
	FILENAME=`echo $D | awk 'BEGIN { RS = "/" }; END {print $1}'`;
	FOLDERNAME=`echo $D | awk -F'/[^/]*$' '{print $1}' | awk 'BEGIN { RS = "/" }; END {print $1}'`;
	FILEEXTENSION=`echo $FILENAME | awk -F . '{if (NF>1) {print $NF}}'`;
	FNAME=`echo $FILENAME | awk 'BEGIN {FS = ".xml"}; END {print $1}' | awk 'BEGIN {FS = ".dbs"}; END {print $1}'`;
	if [ "$FOLDERNAME" = "dataservice" ]
		then
			PROTOTYPE='service';
			SERVERROLE='EnterpriseServiceBus'; #if you use dss features in esb, but if you use standalone dss set this property to DataServicesServer
		else
			PROTOTYPE='synapse';
			SERVERROLE='EnterpriseServiceBus';
	fi
	TYPE=`echo $FOLDERNAME | sed 's/local-entries/local-entry/g;s/proxy-services/proxy-service/g;s/sequences/sequence/g;s/endpoints/endpoint/g;s/tasks/task/g;s/templates/template/g;'`
	echo '<dependency artifact="'$FNAME'" version="'$CARVERSION'" include="true" serverRole="EnterpriseServiceBus"/>' >> 'CARFile_'$CARVERSION/artifacts.xml
	mkdir 'CARFile_'$CARVERSION/$FNAME'_'$CARVERSION;
	echo '<?xml version="1.0" encoding="UTF-8"?><artifact name="'$FNAME'" version="'$CARVERSION'" type="'$PROTOTYPE'/'$TYPE'" serverRole="'$SERVERROLE'">
	    <file>'$FNAME'-'$CARVERSION'.'$FILEEXTENSION'</file>
	</artifact>' > 'CARFile_'$CARVERSION/$FNAME'_'$CARVERSION/artifact.xml

	cp $D 'CARFile_'$CARVERSION/$FNAME'_'$CARVERSION/$FNAME'-'$CARVERSION'.'$FILEEXTENSION
done
echo '</artifact></artifacts>' >> 'CARFile_'$CARVERSION/artifacts.xml

cd 'CARFile_'$CARVERSION
zip -r $CARNAME'_'$CARVERSION'.car' . 
cd $CURRENTPATH;
echo '';
echo '-------------------[ Finish bulding ]---------------------';
echo 'car is here:'$PATHTOPROJECT'CARFile_'$CARVERSION'/'$CARNAME'_'$CARVERSION'.car'
echo '';
