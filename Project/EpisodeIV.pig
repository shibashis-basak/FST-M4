inputFile = LOAD 'hdfs:///user/root/sbasak/inputs/episodeIV_dialouges.txt' AS (line);
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
grpd = GROUP words BY word;
word_count = FOREACH grpd GENERATE group AS word, COUNT(words) AS count;
ordered_word_count = ORDER word_count BY count DESC;
STORE ordered_word_count INTO 'hdfs:///user/root/sbasak/outputs/episodeIVoutput';