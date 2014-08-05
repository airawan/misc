##Mostly TomeNET related scripts (www.tomenet.net)


**highscore_collector.c**	Tool to collate multiple high score files together to get a global/timeless highscore

**character.pl**	Collects and counts CHARACTER-related lines that are in the tomenet.log. (protip: grep ^CHARACTER tomenet.log > character.log)

**generate_skills.js.sh**	Runs tables.c through gcc and feeds it to the next script

**tableparser.pl**	Process a clean tables.c to generate the proper skill mods and values to use in the skill builder. You should use generate_skills.js.sh

