<?php
set_time_limit(0); // make it run forever
//$pid=shell_exec('nohup /usr/local/bin/php /oac/search/php-daemon/wcm-daemon/wcm-daemon.php WcmCrawlWorker >/dev/null &');
//while(true) {
//  $exe=shell_exec('/usr/local/bin/php /app/search/php-daemon/wcm-scheduler/sqs-scheduler.php >> /data/logs/cron.log');
//  sleep(60);
//}
$exe=shell_exec('/app/norconex/norconex-jef-monitor-4.0.5/jef-monitor.sh >/dev/null 2>&1');