# This is a test for pre ELK production env

## Test env

### elasticsearch

- host: 192.168.39.21
- port: 9200 9300
- user: elastic
- password: rogerfan
- type: docker containers
- comment: three instance in one host
- process: done

### kibana

- host: 192.168.39.21
- port: 5601
- user: elastic
- password: rogerfan
- type: docker containers
- comment: three instance in one host
- process: done

### logstash

- host: 192.168.39.22 192.168.39.6(not created)
- port: 9600 5044
- type: docker containers
- comment: docker compose
- config:
  - index(not sure using which one):
    1. {date}-{testlevel}-  2023/3/17-pr, 2023/3/17-release
    2. {date}
  - tags:
    1. casename
    2. date 2023.3.17.xx.xx.xx  ? if this has conflict with timestamp
    3. testlevel            pr, daily, feature, release
    4. branch
    5. host
    6. testparam
    7. log level if has (WARN, INFO, ERROR)
    8. timestamp            timestamp(date) that case gengrated
    9. trace                potentially that the message in logfile that has no timestamp
- process: doing

### filebeat

- host: 192.168.124.70(asic-daily) 192.168.113.149(x86) 192.168.33.210(asic-daily) 192.168.111.39(asic-pr,stopped-too much logs)
- set up folder: /home/tcnsh/roger
- port: 5044
- type: rpm install as system service
- comment: none
- process: testing on 39.21 sim-docker

## Test executed

- one line is too long that looks like two lines in logfile. Is this one line or two line?
  - one line
    2023-02-09 09:13:38,990 INFO The path /home/tcnsh/work/samanea/Samanea_Scripts This case arg is python3 ./DataPath/DP_AsyncIOWithBigSize.py --runType Pre-commit Regression --branchName asic-simulator-quince-PreCI --jenkinsInfo [http://192.168.111.64:8080/job/asic-simlator-samanea-mr/2064/] --runID asic-simulator --testLevel PreCI --codeVersion vU.0.0@2c8e0e_15744 --asicSimulator 1 --seed 126482
