#!/bin/bash

echo "###### Script bash copia e incolla su shell per creazione classi DTO da classi JPA v2020-12-18o  #######";\
cd ~/eclipse-workspace/gestop/src/main/java/model/;\
rm ../it/fub/rpo/gestop/shared/dto/*;\
rm appo/*;\
for e in `ls *.java` ;do export ENTITA=${e%.*} ;\
  export FILE_ENTITA_DTO=${ENTITA}DTO.java;\
  echo "##  e = $e -  variabile e : $e -  copia  $ENTITA.java --> $FILE_ENTITA_DTO ##";\
  cp $ENTITA.java $FILE_ENTITA_DTO ;\
  sed -i -e 's/^@.*$//g' $FILE_ENTITA_DTO;\
  sed -i -e 's/^\t@.*$//g' $FILE_ENTITA_DTO ;\
  sed -i -e '/^$/d' $FILE_ENTITA_DTO;\
  sed -i -e 's/The\ persistent class\ for\ the\ elenco_sottomesso\ database table\.//g' $FILE_ENTITA_DTO;\
  sed -i -e 's/import\ javax\.persistence\.\*\;//g' $FILE_ENTITA_DTO;\
  sed -i -e 's/package\ model\;/package\ model\.appo\;/g' $FILE_ENTITA_DTO;\
  echo "## sostituzione ENTITA_SEC --> ENTITA_SEC_DTO ##  in  ENTITA primaria  $ENTITA " ;\
  for es in `ls *[^DTO].java` ; do export ENTITA_SEC=${es%.*} ; export ENTITA_SEC_DTO=${ENTITA_SEC}DTO;\
     echo "### Dentro IL CICLO INTERNO   es = $es - ENTITA primaria: $ENTITA - ENTITA_SEC:  $ENTITA_SEC -->  $ENTITA_SEC_DTO #";\
     sed -i -e "s/\(\ \|(\|\<\)\(${ENTITA_SEC}\)\(\ \|(\|\>\)/\1\2DTO\3/g" $FILE_ENTITA_DTO;\
  done;\
done ;\
mkdir ../dto;\
mv *DTO* ../dto/
