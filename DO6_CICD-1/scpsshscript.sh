#!/bin/bash

echo $PWD
scp $PWD/src/cat/s21_cat produser@192.168.1.31:/usr/local/bin
scp $PWD/src/grep/s21_grep produser@192.168.1.31:/usr/local/bin
#scp -2 ../gitlab-runner/builds/qz6FcoKL/0/students/DO6_CICD.ID_356283/harodonw_student.21_school.ru/DO6_CICD-1/src/cat/s21_cat ${CI_CD_ENV_VAR}@${NEW_IP_SERVER}:/usr/local/bin
#sshpass -p ${CI_CD_ENV_VAR} scp ../gitlab-runner/builds/qz6FcoKL/0/students/DO6_CICD.ID_356283/harodonw_student.21_school.ru/DO6_CICD-1/src/cat/s21_cat ${CI_CD_ENV_VAR}@${NEW_IP_SERVER}:/usr/local/bin
#sshpass -p ${CI_CD_ENV_VAR} ../gitlab-runner/builds/qz6FcoKL/0/students/DO6_CICD.ID_356283/harodonw_student.21_school.ru/DO6_CICD-1/src/grep/s21_grep ${CI_CD_ENV_VAR}@${NEW_IP_SERVER}:/usr/local/bin
#sshpass -p produser scp -2 ../gitlab-runner/builds/qz6FcoKL/0/students/DO6_CICD.ID_356283/harodonw_student.21_school.ru/DO6_CICD-1/src/cat/s21_cat produser@192.168.1.31:/usr/local/bin
#sshpass -p produser scp -2 ../gitlab-runner/builds/qz6FcoKL/0/students/DO6_CICD.ID_356283/harodonw_student.21_school.ru/DO6_CICD-1/src/grep/s21_grep produser@192.168.1.31:/usr/local/bin
#ssh produser@192.168.1.31 ls -la ../../usr/local/
#scp DO5_SimpleDocker-1/src/03/nginx.conf  produser@192.168.1.31:/usr/local/bin
