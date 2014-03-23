#!/bin/bash
show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`


    echo "${NUMBER}
.................                                                                        .................
.. ..............   ....  ....  ..          .       .  . ..                       . .    . ...............
..,M,................         .M.                          .7I                    FF     FF .......... . .
..,M, .  .... .  ,   . . . .. .M. ...              . ...   .FF      ..          . FF      .......   . ....
..,MNI?MN...MD~=NM   =MO~=N.. .MD?~MN.           .MO~+M.  ~~FF~~~  .FF   FF  :M8=FFM  .~~FF ....:MD:DM ...
..,M7.  M.       M.  FF .     .M=  ,M.           .M . ..   .FF     .FF   FF  MI   FF     FF ....FF...MZ...
..,M.   M,  FF=  M,   :FFMN.  .M.  ,M.            ,FFFF    .FF      FF.  FF  M,   FF     FF ....FF...FF ..
..,MZ  .M .,M,  .M,   .  .M,  .M.  ,M.                FF   .FF      NM. .FF  MZ.  FF     FF ....FF...MI...
..,M8DDMZ.. FFZMNM,  FFOOFF . .M.  ,M.   . . ... .MOZFF, ...8FFND  .,FFZNFF...FFOFFM .,FFFFFF. ..FFZFF....
 . ..                                    . . ... . ... . ... . ... . ... . ... . ... .  ............... ..
............      ... .  .  project generator for wso2 dev studio & car builder  .      -9................
  .....                                                                                    ..............
${NORMAL}"


    echo "${MENU}************************************************************************${NORMAL}"
    echo "${MENU}*${NUMBER} 1)${MENU} Make project file structure ${NORMAL}"
    echo "${MENU}*${NUMBER} 2)${MENU} Make or recreate artifact.xml ${NORMAL}"
    echo "${MENU}*${NUMBER} 3)${MENU} Build Carbon App (CAR) Archive form project folder ${NORMAL}"
    echo "${MENU}*${NUMBER} 4)${MENU} Clear screen ${NORMAL}"
    echo "${MENU}*${NUMBER} 5)${MENU} Exit ${NORMAL}"
    echo "${MENU}************************************************************************${NORMAL}"
    echo "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-${RESET}"Error: No message passed"}
    echo "${COLOR}${MESSAGE}${RESET}"
}

clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;
        option_picked "Make project file structure";
        echo -n "Enter project name (in camelCase by default or other) and press [ENTER]:"
        read PROJECTNAME
    	mkdir $PROJECTNAME
    	mkdir $PROJECTNAME/src
    	mkdir $PROJECTNAME/src/main
    	mkdir $PROJECTNAME/src/main/synapse-config
    	mkdir $PROJECTNAME/src/main/synapse-config/api
    	mkdir $PROJECTNAME/src/main/synapse-config/endpoints
    	mkdir $PROJECTNAME/src/main/synapse-config/local-entries
    	mkdir $PROJECTNAME/src/main/synapse-config/message-processors
    	mkdir $PROJECTNAME/src/main/synapse-config/message-stores
    	mkdir $PROJECTNAME/src/main/synapse-config/proxy-services
    	mkdir $PROJECTNAME/src/main/synapse-config/sequences
    	mkdir $PROJECTNAME/src/main/synapse-config/tasks
    	mkdir $PROJECTNAME/src/main/synapse-config/templates
    	option_picked "folder creation complete (stage 1 of 3)";
    	echo '<?xml version="1.0" encoding="UTF-8"?>' > $PROJECTNAME/.project
		echo '<projectDescription>' >> $PROJECTNAME/.project
		echo '	<name>'$PROJECTNAME'</name>' >> $PROJECTNAME/.project
		echo '	<coFFent></coFFent>' >> $PROJECTNAME/.project
		echo '	<projects>' >> $PROJECTNAME/.project
		echo '	</projects>' >> $PROJECTNAME/.project
		echo '	<buildSpec>' >> $PROJECTNAME/.project
		echo '	</buildSpec>' >> $PROJECTNAME/.project
		echo '	<natures>' >> $PROJECTNAME/.project
		echo '		<nature>org.wso2.developerstudio.eclipse.esb.project.nature</nature>' >> $PROJECTNAME/.project
		echo '	</natures>' >> $PROJECTNAME/.project
		echo '</projectDescription>' >> $PROJECTNAME/.project
		option_picked "generate .project complete (stage 2 of 3)";
		echo '<?xml version="1.0" encoding="UTF-8"?>' > $PROJECTNAME/pom.xml
		echo '<project xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd" xmlns="http://maven.apache.org/POM/4.0.0"' >> $PROJECTNAME/pom.xml
		echo '    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">' >> $PROJECTNAME/pom.xml
		echo '  <modelVersion>4.0.0</modelVersion>' >> $PROJECTNAME/pom.xml
		echo '  <groupId>com.example.'$PROJECTNAME'</groupId>' >> $PROJECTNAME/pom.xml
		echo '  <artifactId>'$PROJECTNAME'</artifactId>' >> $PROJECTNAME/pom.xml
		echo '  <version>1.0.0</version>' >> $PROJECTNAME/pom.xml
		echo '  <packaging>pom</packaging>' >> $PROJECTNAME/pom.xml
		echo '  <name>'$PROJECTNAME'</name>' >> $PROJECTNAME/pom.xml
		echo '  <description>'$PROJECTNAME' autogen</description>' >> $PROJECTNAME/pom.xml
		echo '  <build>' >> $PROJECTNAME/pom.xml
		echo '    <directory>target/capp</directory>' >> $PROJECTNAME/pom.xml
		echo '   <plugins>' >> $PROJECTNAME/pom.xml
		echo '      <plugin>' >> $PROJECTNAME/pom.xml
		echo '        <groupId>org.codehaus.mojo</groupId>' >> $PROJECTNAME/pom.xml
		echo '        <artifactId>exec-maven-plugin</artifactId>' >> $PROJECTNAME/pom.xml
		echo '        <version>1.2</version>' >> $PROJECTNAME/pom.xml
		echo '        <extensions>true</extensions>' >> $PROJECTNAME/pom.xml
		echo '        <executions>' >> $PROJECTNAME/pom.xml
		echo '          <execution>' >> $PROJECTNAME/pom.xml
		echo '            <phase>install</phase>' >> $PROJECTNAME/pom.xml
		echo '            <goals>' >> $PROJECTNAME/pom.xml
		echo '              <goal>exec</goal>' >> $PROJECTNAME/pom.xml
		echo '            </goals>' >> $PROJECTNAME/pom.xml
		echo '            <configuration>' >> $PROJECTNAME/pom.xml
		echo '              <executable>mvn</executable>' >> $PROJECTNAME/pom.xml
		echo '              <workingDirectory>${project.build.directory}</workingDirectory>' >> $PROJECTNAME/pom.xml
		echo '              <arguments>' >> $PROJECTNAME/pom.xml
		echo '                <argument>clean</argument>' >> $PROJECTNAME/pom.xml
		echo '                <argument>install</argument>' >> $PROJECTNAME/pom.xml
		echo '                <argument>-Dmaven.test.skip=${maven.test.skip}</argument>' >> $PROJECTNAME/pom.xml
		echo '              </arguments>' >> $PROJECTNAME/pom.xml
		echo '            </configuration>' >> $PROJECTNAME/pom.xml
		echo '          </execution>' >> $PROJECTNAME/pom.xml
		echo '        </executions>' >> $PROJECTNAME/pom.xml
		echo '        <configuration />' >> $PROJECTNAME/pom.xml
		echo '      </plugin>' >> $PROJECTNAME/pom.xml
		echo '      <plugin>' >> $PROJECTNAME/pom.xml
		echo '        <artifactId>maven-eclipse-plugin</artifactId>' >> $PROJECTNAME/pom.xml
		echo '        <version>2.9</version>' >> $PROJECTNAME/pom.xml
		echo '        <configuration>' >> $PROJECTNAME/pom.xml
		echo '         <buildcoFFands />' >> $PROJECTNAME/pom.xml
		echo '          <projectnatures>' >> $PROJECTNAME/pom.xml
		echo '            <projectnature>org.wso2.developerstudio.eclipse.esb.project.nature</projectnature>' >> $PROJECTNAME/pom.xml
		echo '          </projectnatures>' >> $PROJECTNAME/pom.xml
		echo '        </configuration>' >> $PROJECTNAME/pom.xml
		echo '      </plugin>' >> $PROJECTNAME/pom.xml
		echo '      <plugin>' >> $PROJECTNAME/pom.xml
		echo '        <groupId>org.wso2.maven</groupId>' >> $PROJECTNAME/pom.xml
		echo '        <artifactId>wso2-esb-proxy-plugin</artifactId>' >> $PROJECTNAME/pom.xml
		echo '        <version>2.0.4</version>' >> $PROJECTNAME/pom.xml
		echo '        <extensions>true</extensions>' >> $PROJECTNAME/pom.xml
		echo '        <executions>' >> $PROJECTNAME/pom.xml
		echo '          <execution>' >> $PROJECTNAME/pom.xml
		echo '            <id>proxy</id>' >> $PROJECTNAME/pom.xml
		echo '            <phase>process-resources</phase>' >> $PROJECTNAME/pom.xml
		echo '            <goals>' >> $PROJECTNAME/pom.xml
		echo '              <goal>pom-gen</goal>' >> $PROJECTNAME/pom.xml
		echo '            </goals>' >> $PROJECTNAME/pom.xml
		echo '            <configuration>' >> $PROJECTNAME/pom.xml
		echo '              <artifactLocation>.</artifactLocation>' >> $PROJECTNAME/pom.xml
		echo '              <typeList>${artifact.types}</typeList>' >> $PROJECTNAME/pom.xml
		echo '            </configuration>' >> $PROJECTNAME/pom.xml
		echo '          </execution>' >> $PROJECTNAME/pom.xml
		echo '        </executions>' >> $PROJECTNAME/pom.xml
		echo '        <configuration />' >> $PROJECTNAME/pom.xml
		echo '      </plugin>' >> $PROJECTNAME/pom.xml
		echo '      <plugin>' >> $PROJECTNAME/pom.xml
		echo '        <groupId>org.wso2.maven</groupId>' >> $PROJECTNAME/pom.xml
		echo '        <artifactId>wso2-esb-sequence-plugin</artifactId>' >> $PROJECTNAME/pom.xml
		echo '        <version>2.0.4</version>' >> $PROJECTNAME/pom.xml
		echo '        <extensions>true</extensions>' >> $PROJECTNAME/pom.xml
		echo '        <executions>' >> $PROJECTNAME/pom.xml
		echo '          <execution>' >> $PROJECTNAME/pom.xml
		echo '            <id>sequence</id>' >> $PROJECTNAME/pom.xml
		echo '            <phase>process-resources</phase>' >> $PROJECTNAME/pom.xml
		echo '            <goals>' >> $PROJECTNAME/pom.xml
		echo '              <goal>pom-gen</goal>' >> $PROJECTNAME/pom.xml
		echo '            </goals>' >> $PROJECTNAME/pom.xml
		echo '            <configuration>' >> $PROJECTNAME/pom.xml
		echo '              <artifactLocation>.</artifactLocation>' >> $PROJECTNAME/pom.xml
		echo '              <typeList>${artifact.types}</typeList>' >> $PROJECTNAME/pom.xml
		echo '            </configuration>' >> $PROJECTNAME/pom.xml
		echo '          </execution>' >> $PROJECTNAME/pom.xml
		echo '        </executions>' >> $PROJECTNAME/pom.xml
		echo '        <configuration />' >> $PROJECTNAME/pom.xml
		echo '      </plugin>' >> $PROJECTNAME/pom.xml
		echo '      <plugin>' >> $PROJECTNAME/pom.xml
		echo '        <groupId>org.wso2.maven</groupId>' >> $PROJECTNAME/pom.xml
		echo '        <artifactId>wso2-esb-endpoint-plugin</artifactId>' >> $PROJECTNAME/pom.xml
		echo '        <version>2.0.4</version>' >> $PROJECTNAME/pom.xml
		echo '        <extensions>true</extensions>' >> $PROJECTNAME/pom.xml
		echo '        <executions>' >> $PROJECTNAME/pom.xml
		echo '          <execution>' >> $PROJECTNAME/pom.xml
		echo '            <id>endpoint</id>' >> $PROJECTNAME/pom.xml
		echo '            <phase>process-resources</phase>' >> $PROJECTNAME/pom.xml
		echo '            <goals>' >> $PROJECTNAME/pom.xml
		echo '              <goal>pom-gen</goal>' >> $PROJECTNAME/pom.xml
		echo '            </goals>' >> $PROJECTNAME/pom.xml
		echo '            <configuration>' >> $PROJECTNAME/pom.xml
		echo '              <artifactLocation>.</artifactLocation>' >> $PROJECTNAME/pom.xml
		echo '              <typeList>${artifact.types}</typeList>' >> $PROJECTNAME/pom.xml
		echo '            </configuration>' >> $PROJECTNAME/pom.xml
		echo '          </execution>' >> $PROJECTNAME/pom.xml
		echo '        </executions>' >> $PROJECTNAME/pom.xml
		echo '        <configuration />' >> $PROJECTNAME/pom.xml
		echo '      </plugin>' >> $PROJECTNAME/pom.xml
		echo '    </plugins>' >> $PROJECTNAME/pom.xml
		echo '  </build>' >> $PROJECTNAME/pom.xml
		echo '  <repositories>' >> $PROJECTNAME/pom.xml
		echo '    <repository>' >> $PROJECTNAME/pom.xml
		echo '      <releases>' >> $PROJECTNAME/pom.xml
		echo '        <updatePolicy>daily</updatePolicy>' >> $PROJECTNAME/pom.xml
		echo '        <checksumPolicy>ignore</checksumPolicy>' >> $PROJECTNAME/pom.xml
		echo '      </releases>' >> $PROJECTNAME/pom.xml
		echo '      <id>wso2-nexus</id>' >> $PROJECTNAME/pom.xml
		echo '      <url>http://maven.wso2.org/nexus/content/groups/wso2-public/</url>' >> $PROJECTNAME/pom.xml
		echo '    </repository>' >> $PROJECTNAME/pom.xml
		echo '  </repositories>' >> $PROJECTNAME/pom.xml
		echo '  <pluginRepositories>' >> $PROJECTNAME/pom.xml
		echo '    <pluginRepository>' >> $PROJECTNAME/pom.xml
		echo '      <releases>' >> $PROJECTNAME/pom.xml
		echo '        <updatePolicy>daily</updatePolicy>' >> $PROJECTNAME/pom.xml
		echo '        <checksumPolicy>ignore</checksumPolicy>' >> $PROJECTNAME/pom.xml
		echo '      </releases>' >> $PROJECTNAME/pom.xml
		echo '      <id>wso2-nexus</id>' >> $PROJECTNAME/pom.xml
		echo '      <url>http://maven.wso2.org/nexus/content/groups/wso2-public/</url>' >> $PROJECTNAME/pom.xml
		echo '    </pluginRepository>' >> $PROJECTNAME/pom.xml
		echo '  </pluginRepositories>' >> $PROJECTNAME/pom.xml
		echo '  <properties>' >> $PROJECTNAME/pom.xml
		echo '    <maven.test.skip>false</maven.test.skip>' >> $PROJECTNAME/pom.xml
		echo '    <CApp.type>bpel/workflow=zip,lib/registry/filter=jar,webapp/jaxws=war,lib/library/bundle=jar,service/dataservice=dbs,synapse/local-entry=xml,synapse/proxy-service=xml,carbon/application=car,registry/resource=zip,lib/dataservice/validator=jar,synapse/endpoint=xml,web/application=war,lib/carbon/ui=jar,service/axis2=aar,synapse/sequence=xml,synapse/configuration=xml,wso2/gadget=dar,lib/registry/handlers=jar,lib/synapse/mediator=jar,synapse/task=xml,synapse/api=xml,synapse/template=xml,synapse/message-store=xml,synapse/message-processors=xml</CApp.type>' >> $PROJECTNAME/pom.xml
		echo '  </properties>' >> $PROJECTNAME/pom.xml
		echo '</project>' >> $PROJECTNAME/pom.xml
		option_picked "generate pom.xml complete  (stage 3 of 3)";
        show_menu;
        ;;

        2)  clear;
            option_picked "Make or recreate artifact.xml";
            echo -n "Enter path to your project and press [ENTER]:"
            read PATHTOPROJECT
            CURRENTPATH=`pwd`;
            PROJECTNAME=`echo $PATHTOPROJECT | awk 'BEGIN { RS = "/" }; END {print $1}'`;
            cd $PATHTOPROJECT;
			echo '<?xml version="1.0" encoding="UTF-8"?><artifacts>' > artifact.xml
			for D in `find . -name '*.xml' ! -name 'pom.xml' ! -name 'artifact.xml'`
			do
				#Get full filename
				echo 'add:'$D
				FILENAME=`echo $D | awk 'BEGIN { RS = "/" }; END {print $1}'`;
				FOLDERNAME=`echo $D | awk -F'/[^/]*$' '{print $1}' | awk 'BEGIN { RS = "/" }; END {print $1}'`;
				FNAME=`echo $FILENAME | awk 'BEGIN {FS = ".xml"}; END {print $1}'`;
				PATCHSTR='./'
				PATHTOXML=`echo $D | sed 's/^.\///g'`;
				TYPE=`echo $FOLDERNAME | sed 's/local-entries/local-entry/g;s/proxy-services/proxy-service/g;s/sequences/sequence/g;s/endpoints/endpoint/g;s/tasks/task/g;s/templates/template/g;'`
				echo '			    <artifact name="'$FNAME'" groupId="com.example.'$PROJECTNAME'.'$TYPE'" version="1.0.0" type="synapse/'$TYPE'" serverRole="EnterpriseServiceBus">
			        <file>'$PATHTOXML'</file>
			    </artifact>' >> artifact.xml
			done
			echo '</artifacts>' >> artifact.xml
			cd $CURRENTPATH;
			option_picked "artifact.xml is done";
        show_menu;
            ;;

        3) clear;
            option_picked "CAR bulider";
            echo -n 'Enter path to project folderand press [ENTER]:'
        	read PATHTOPROJECT;
        	echo -n 'Enter car name and press [ENTER]:'
        	read CARNAME;
        	echo -n 'Enter car version and press [ENTER]:'
        	read CARVERSION;
 
            CURRENTPATH=`pwd`;
            PROJECTNAME=`echo $PATHTOPROJECT | awk 'BEGIN { RS = "/" }; END {print $1}'`;
            cd $PATHTOPROJECT;
            mkdir 'CARFile_'$CARVERSION
			echo '<?xml version="1.0" encoding="UTF-8"?><artifacts>' > 'CARFile_'$CARVERSION/artifacts.xml
			echo '<artifact name="'$CARNAME'" version="'$CARVERSION'" type="carbon/application">' >> 'CARFile_'$CARVERSION/artifacts.xml
			for D in `find . -name '*.xml' ! -name 'pom.xml' ! -name 'artifact.xml' ! -name 'artifacts.xml' ! -path '*CARFile*'`
			do
				#Get full filename
				echo 'add:'$D
				FILENAME=`echo $D | awk 'BEGIN { RS = "/" }; END {print $1}'`;
				FOLDERNAME=`echo $D | awk -F'/[^/]*$' '{print $1}' | awk 'BEGIN { RS = "/" }; END {print $1}'`;
				FNAME=`echo $FILENAME | awk 'BEGIN {FS = ".xml"}; END {print $1}'`;
				PATCHSTR='./'
				PATHTOXML=`echo $D | sed 's/^.\///g'`;
				TYPE=`echo $FOLDERNAME | sed 's/local-entries/local-entry/g;s/proxy-services/proxy-service/g;s/sequences/sequence/g;s/endpoints/endpoint/g;s/tasks/task/g;s/templates/template/g;'`
				echo '<dependency artifact="'$FNAME'" version="1.0.0" include="true" serverRole="EnterpriseServiceBus"/>' >> 'CARFile_'$CARVERSION/artifacts.xml
				mkdir 'CARFile_'$CARVERSION/$FNAME'_1.0.0';
				echo '<?xml version="1.0" encoding="UTF-8"?><artifact name="'$FNAME'" version="1.0.0" type="synapse/'$TYPE'" serverRole="EnterpriseServiceBus">
				    <file>'$FNAME'-1.0.0.xml</file>
				</artifact>' > 'CARFile_'$CARVERSION/$FNAME'_1.0.0'/artifact.xml
				cp $D 'CARFile_'$CARVERSION/$FNAME'_1.0.0'/$FNAME'-1.0.0.xml'
			done
			echo '</artifact></artifacts>' >> 'CARFile_'$CARVERSION/artifacts.xml
			
			option_picked "file structure is done. now packaging";
			cd 'CARFile_'$CARVERSION
			zip -r $CARNAME'_'$CARVERSION'.car' . 
			option_picked 'packaging is done:'$CARNAME'_'$CARVERSION'.car';
			cd $CURRENTPATH;
        	show_menu;
            ;;

        *)clear;
        
        exit;
        ;;
    esac
fi
done
