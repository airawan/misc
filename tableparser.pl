#!/usr/bin/perl
#print out skills.js used in skillbuilder.php given a tables.c
#ideally we shouldn't hardcode anything here, but contents from defines.h will have to be manually changed.

my %races_TOKEN = ( 
 "Human"=>"RACE_HUMAN",
 "Half-Elf"=>"RACE_HALF_ELF",
 "Elf"=>"RACE_ELF",
 "Hobbit"=>"RACE_HOBBIT",
 "Gnome"=>"RACE_GNOME",
 "Dwarf"=>"RACE_DWARF",
 "Half-Orc"=>"RACE_HALF_ORC",
 "Half-Troll"=>"RACE_HALF_TROLL",
 "Dunadan"=>"RACE_DUNADAN",
 "High-Elf"=>"RACE_HIGH_ELF",
 "Yeek"=>"RACE_YEEK",
 "Goblin"=>"RACE_GOBLIN",
 "Ent"=>"RACE_ENT",
 "Draconian"=>"RACE_DRIDER",
 "Kobold"=>"RACE_KOBOLD",
 "Dark-Elf"=>"RACE_DARK_ELF",
 "Vampire"=>"RACE_VAMPIRE",
 "Maia"=>"RACE_DIVINE",
);


my %classes_TOKEN = (
"Warrior"=>"CLASS_WARRIOR",
"Istar"=>"CLASS_MAGE",
"Priest"=>"CLASS_PRIEST",
"Rogue"=>"CLASS_ROGUE",
"Mimic"=>"CLASS_MIMIC",
"Archer"=>"CLASS_ARCHER",
"Paladin"=>"CLASS_PALADIN",
"Ranger"=>"CLASS_RANGER",
"Adventurer"=>"CLASS_ADVENTURER",
"Druid"=>"CLASS_DRUID",
"Shaman"=>"CLASS_SHAMAN",
"Runemaster"=>"CLASS_RUNEMASTER",
"Mindcrafter"=>"CLASS_MINDCRAFTER",
);
 


#Header time!
print <<EOM;
var has_parse = 0;
var BODYFORM = [];
var SKILLS = [];
var FRIENDLY = [];
var SPELL = [];
var MAX_RACE = 17; 
var MAX_CLASS = 14;

SKILLS['SKILL_COMBAT']= 1;
 SKILLS['SKILL_MASTERY']= 2;
 SKILLS['SKILL_SWORD']= 3;
 SKILLS['SKILL_CRITS']= 4;
 SKILLS['SKILL_POLEARM']= 5;

SKILLS['SKILL_BLUNT']= 6;
 SKILLS['SKILL_ARCHERY']= 7;
 SKILLS['SKILL_SLING']= 8;
 SKILLS['SKILL_BOW']= 9;
 SKILLS['SKILL_XBOW']= 10;

SKILLS['SKILL_BACKSTAB']= 11;
 SKILLS['SKILL_MAGIC']= 12;
 SKILLS['SKILL_SHOOT_TILL_KILL']= 13;
 SKILLS['SKILL_SORCERY']= 14;
 SKILLS['SKILL_MAGERY']= 15;

SKILLS['SKILL_MIMIC']= 16;
 SKILLS['SKILL_DEVICE']= 17;
 SKILLS['SKILL_SHADOW']= 18;
 SKILLS['SKILL_PRAY']= 19;
 SKILLS['SKILL_SPELLLENGTH']= 20;

SKILLS['SKILL_SNEAKINESS']= 21;

//SKILLS['SKILL_DISARM']= 22;

SKILLS['SKILL_STEALTH']= 23;
 SKILLS['SKILL_STEALING']= 24;
 SKILLS['SKILL_NECROMANCY']= 25;

SKILLS['SKILL_ANTIMAGIC']= 26;
 SKILLS['SKILL_AURA_POWER']= 27;
 SKILLS['SKILL_TRAUMATURGY']= 27;

SKILLS['SKILL_AURA_FEAR']= 28;
 SKILLS['SKILL_AURA_SHIVER']= 29;
 SKILLS['SKILL_AURA_DEATH']= 30;
 SKILLS['SKILL_HUNTING']= 31;
 SKILLS['SKILL_TECHNIQUE']= 32;

SKILLS['SKILL_MISC']= 33;
 SKILLS['SKILL_AGILITY']= 34;
 SKILLS['SKILL_CALMNESS']= 35;
 SKILLS['SKILL_SWIM']= 36;
 SKILLS['SKILL_MARTIAL_ARTS']= 37;

SKILLS['SKILL_RICOCHET']= 38;
 SKILLS['SKILL_BOOMERANG']= 39;
 SKILLS['SKILL_TRAINING']= 40;
 SKILLS['SKILL_INTERCEPT']= 41;
 SKILLS['SKILL_DODGE']= 42;

SKILLS['SKILL_HEALTH']= 43;
 SKILLS['SKILL_DIG']= 44;
 SKILLS['SKILL_SPELLRAD']= 45;
 SKILLS['SKILL_TRAPPING']= 46;
 SKILLS['SKILL_AXE']= 47;

SKILLS['SKILL_CONVEYANCE']= 48;
 SKILLS['SKILL_SPELL']= 49;
 SKILLS['SKILL_MANA']= 50;
 SKILLS['SKILL_FIRE']= 51;
 SKILLS['SKILL_AIR']= 52;

SKILLS['SKILL_WATER']= 53;
 SKILLS['SKILL_NATURE']= 54;
 SKILLS['SKILL_EARTH']= 55;
 SKILLS['SKILL_DIVINATION']= 56;
 SKILLS['SKILL_TEMPORAL']= 57;

SKILLS['SKILL_META']= 58;
 SKILLS['SKILL_MIND']= 59;
 SKILLS['SKILL_UDUN']= 60;
 SKILLS['SKILL_HOFFENSE']= 70;
 SKILLS['SKILL_HDEFENSE']= 71;

SKILLS['SKILL_HCURING']= 72;
 SKILLS['SKILL_HSUPPORT']= 73;
 SKILLS['SKILL_DRUID_ARCANE']= 74;
 SKILLS['SKILL_DRUID_PHYSICAL']= 75;
 SKILLS['SKILL_RUNEMASTERY']= 76;

SKILLS['SKILL_ASTRAL']= 77;
 SKILLS['SKILL_DUAL']= 78;
 SKILLS['SKILL_STANCE']= 79;
 SKILLS['SKILL_PPOWER']= 80;
 SKILLS['SKILL_TCONTACT']= 81;

SKILLS['SKILL_MINTRUSION']= 82;
 SKILLS['SKILL_SCHOOL_MAGIC']= 83;
 SKILLS['SKILL_SCHOOL_PRAYING']= 84;
 SKILLS['SKILL_SCHOOL_DRUIDISM']= 85;
 SKILLS['SKILL_SCHOOL_MINDCRAFT']= 86;

SKILLS['SKILL_CLIMB']= 90;
 SKILLS['SKILL_FLY']= 91;
 SKILLS['SKILL_FREEACT']= 92;
 SKILLS['SKILL_RESCONF']= 93;

//SKILLS['SKILL_SCHOOL_RUNECRAFT']= 95; 
 SKILLS['SKILL_R_LITE']= 96; 
 SKILLS['SKILL_R_DARK']= 97; 
 SKILLS['SKILL_R_NEXU']= 98; 
 SKILLS['SKILL_R_NETH']= 99; 
 SKILLS['SKILL_R_CHAO']= 100;
 SKILLS['SKILL_R_MANA']= 101;

FRIENDLY['SKILL_CRITS'] = [ 'SKILL_SWORD', 5 ];
FRIENDLY['SKILL_SWORD'] = [ 'SKILL_MASTERY', 15, 'SKILL_COMBAT', 20 ];
FRIENDLY['SKILL_AXE'] = [ 'SKILL_MASTERY', 15, 'SKILL_COMBAT', 20 ];
FRIENDLY['SKILL_POLEARM'] = [ 'SKILL_MASTERY', 15, 'SKILL_COMBAT', 20 ];
FRIENDLY['SKILL_BLUNT'] = [ 'SKILL_MASTERY', 15, 'SKILL_COMBAT', 20 ];

FRIENDLY['SKILL_SLING'] = [ 'SKILL_ARCHERY', 15, 'SKILL_COMBAT', 15 ];
FRIENDLY['SKILL_BOW'] = [ 'SKILL_ARCHERY', 15, 'SKILL_COMBAT', 15 ];
FRIENDLY['SKILL_XBOW'] = [ 'SKILL_ARCHERY', 15, 'SKILL_COMBAT', 15 ];

FRIENDLY['SKILL_MASTERY'] = [ 'SKILL_COMBAT', 20 ];

FRIENDLY['SKILL_ARCHERY'] = [ 'SKILL_COMBAT', 20 ];
FRIENDLY['SKILL_BOOMERANG'] = [ 'SKILL_COMBAT', 15 ];

FRIENDLY['SKILL_MARTIAL_ARTS'] = [ 'SKILL_COMBAT', 20, 'SKILL_DODGE', 20 ];

FRIENDLY['SKILL_DEVICE'] = [ 'SKILL_MAGIC', 7 ];
FRIENDLY['SKILL_SPELL'] = [ 'SKILL_MAGIC', 20 ];
FRIENDLY['SKILL_SORCERY'] = [ 'SKILL_MAGIC', 20 ];
FRIENDLY['SKILL_MANA'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_FIRE'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_AIR'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_WATER'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_EARTH'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_CONVEYANCE'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_DIVINATION'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_NATURE'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_TEMPORAL'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_META'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_MIND'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_UDUN'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_MIMIC'] = [ 'SKILL_MAGIC', 7 ];

FRIENDLY['SKILL_HOFFENSE'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_HDEFENSE'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_HCURING'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_HSUPPORT'] = [ 'SKILL_MAGIC', 10 ];

FRIENDLY['SKILL_ASTRAL'] = [ 'SKILL_MAGIC', 10 ];

FRIENDLY['SKILL_DRUID_ARCANE'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_DRUID_PHYSICAL'] = [ 'SKILL_MAGIC', 10 ];

FRIENDLY['SKILL_PPOWER'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_TCONTACT'] = [ 'SKILL_MAGIC', 10 ];
FRIENDLY['SKILL_MINTRUSION'] = [ 'SKILL_MAGIC', 10 ];

FRIENDLY['SKILL_RUNEMASTERY'] = [ 'SKILL_MAGIC', 20 ];

FRIENDLY['SKILL_R_LITE'] = [ 'SKILL_RUNEMASTERY', 15, 'SKILL_MAGIC', 15 ];
FRIENDLY['SKILL_R_DARK'] = [ 'SKILL_RUNEMASTERY', 15, 'SKILL_MAGIC', 15 ];
FRIENDLY['SKILL_R_NEXU'] = [ 'SKILL_RUNEMASTERY', 15, 'SKILL_MAGIC', 15 ];
FRIENDLY['SKILL_R_NETH'] = [ 'SKILL_RUNEMASTERY', 15, 'SKILL_MAGIC', 15 ];
FRIENDLY['SKILL_R_CHAO'] = [ 'SKILL_RUNEMASTERY', 15, 'SKILL_MAGIC', 15 ];
FRIENDLY['SKILL_R_MANA'] = [ 'SKILL_RUNEMASTERY', 15, 'SKILL_MAGIC', 15 ];

FRIENDLY['SKILL_STEALTH'] = [ 'SKILL_SNEAKINESS', 15 ];
//FRIENDLY['SKILL_DISARM'] = [ 'SKILL_SNEAKINESS', 10 ];
//FRIENDLY['SKILL_TRAPPING'] = [ 'SKILL_DISARM', 15 ];
FRIENDLY['SKILL_TRAPPING'] = [ 'SKILL_SNEAKINESS', 15 ];
FRIENDLY['SKILL_BACKSTAB'] = [ 'SKILL_SNEAKINESS', 5 ];
FRIENDLY['SKILL_STEALING'] = [ 'SKILL_SNEAKINESS', 20 ];
FRIENDLY['SKILL_DODGE'] = [ 'SKILL_SNEAKINESS', 10 ];

FRIENDLY['SKILL_CALMNESS'] = [ 'SKILL_SNEAKINESS', 10 ];

FRIENDLY['SKILL_INTERCEPT'] = [ 'SKILL_COMBAT', 10 ];

FRIENDLY['SKILL_TRAUMATURGY'] = [ 'SKILL_NECROMANCY', 20 ];
FRIENDLY['SKILL_AURA_FEAR']  = [ 'SKILL_NECROMANCY', 20 ];
FRIENDLY['SKILL_AURA_SHIVER'] = [ 'SKILL_NECROMANCY', 20 ];
FRIENDLY['SKILL_AURA_DEATH'] = [ 'SKILL_NECROMANCY', 20 ];

FRIENDLY['SKILL_SWIM'] = [ 'SKILL_HEALTH', 25 ];
FRIENDLY['SKILL_DIG'] = [ 'SKILL_HEALTH', 25 ];
FRIENDLY['SKILL_CLIMB'] = [ 'SKILL_HEALTH', 25 ]; 
 
var RACES = [ "RACE_HUMAN", "RACE_HALF_ELF", "RACE_ELF", "RACE_HOBBIT", "RACE_GNOME", "RACE_DWARF", "RACE_HALF_ORC", "RACE_HALF_TROLL", "RACE_DUNADAN", "RACE_HIGH_ELF", "RACE_YEEK", "RACE_GOBLIN", "RACE_ENT", "RACE_DRIDER", "RACE_DARK_ELF", "RACE_VAMPIRE", "RACE_DIVINE1", "RACE_DIVINE2", "RACE_KOBOLD" ];
var CLASSES = [ "CLASS_WARRIOR", "CLASS_MAGE", "CLASS_PRIEST", "CLASS_ROGUE", "CLASS_MIMIC", "CLASS_ARCHER", "CLASS_PALADIN", "CLASS_RANGER", "CLASS_ADVENTURER", "CLASS_DRUID", "CLASS_SHAMAN", "CLASS_RUNEMASTER", "CLASS_MINDCRAFTER" ];

SPELL['Noxious Cloud']=[2, 'Air']; SPELL['Wing of Wind']=[16, 'Air']; SPELL['Poison Blood']=[22, 'Air']; SPELL['Thunder Storm']=[25, 'Air']; SPELL['Invisibility']=[30, 'Air']; SPELL['Call of the forest']=[1, 'Druid_Arcane']; SPELL['Toxic Moisture']=[3, 'Druid_Arcane']; SPELL['Natures Call']=[10, 'Druid_Arcane']; SPELL['Ancient Lore']=[20, 'Druid_Arcane']; SPELL['Garden of the Gods']=[35, 'Druid_Arcane']; SPELL['Power Bolt']=[1, 'Astral']; SPELL['Power Ray']=[5, 'Astral']; SPELL['Power Blast']=[10, 'Astral']; SPELL['Relocation']=[22, 'Astral']; SPELL['Vengence']=[30, 'Astral']; SPELL['Empowerment']=[40, 'Astral']; SPELL['The Silent Force']=[45, 'Astral']; SPELL['Sphere of Destruction']=[50, 'Astral']; SPELL['Gateway']=[50, 'Astral']; SPELL['Phase Door']=[2, 'Conveyance']; SPELL['Disarm']=[5, 'Conveyance']; SPELL['Teleport']=[10, 'Conveyance']; SPELL['Teleport Away']=[23, 'Conveyance']; SPELL['Recall']=[30, 'Conveyance']; SPELL['Probability Travel']=[35, 'Conveyance']; SPELL['Detect Monsters']=[3, 'Divination']; SPELL['Sense Hidden']=[5, 'Divination']; SPELL['Identify']=[8, 'Divination']; SPELL['Reveal Ways']=[9, 'Divination']; SPELL['Vision']=[15, 'Divination']; SPELL['Greater Identify']=[35, 'Divination']; SPELL['Dig']=[12, 'Earth']; SPELL['Stone Prison']=[25, 'Earth']; SPELL['Strike']=[25, 'Earth']; SPELL['Shake']=[27, 'Earth']; SPELL['Globe of Light']=[2, 'Fire']; SPELL['Fireflash']=[10, 'Fire']; SPELL['Fiery Shield']=[16, 'Fire']; SPELL['Firewall']=[20, 'Fire']; SPELL['Healing']=[3, 'HCuring']; SPELL['Curing']=[16, 'HCuring']; SPELL['Cleansing Light']=[18, 'HCuring']; SPELL['Remove Curses']=[19, 'HCuring']; SPELL['Faithful Focus']=[21, 'HCuring']; SPELL['Soul Curing']=[25, 'HCuring']; SPELL['Resurrection']=[30, 'HCuring']; SPELL['Blessing']=[1, 'HDefense']; SPELL['Holy Resistance']=[11, 'HDefense']; SPELL['Protection from Evil']=[12, 'HDefense']; SPELL['Glyph of Warding']=[35, 'HDefense']; SPELL['Martyrdom']=[40, 'HDefense']; SPELL['Curse']=[1, 'HOffense']; SPELL['Holy Light']=[2, 'HOffense']; SPELL['Release Souls']=[10, 'HOffense']; SPELL['Exocism']=[11, 'HOffense']; SPELL['Orb of Draining']=[20, 'HOffense']; SPELL['Drain Life']=[20, 'HOffense']; SPELL['Doomed Grounds']=[40, 'HOffense']; SPELL['Holy Light']=[2, 'HSupport']; SPELL['Sense Monsters']=[3, 'HSupport']; SPELL['Sanctuary']=[3, 'HSupport']; SPELL['Satisfy Hunger']=[10, 'HSupport']; SPELL['Sense Surroundings']=[10, 'HSupport']; SPELL['Zeal']=[31, 'HSupport']; SPELL['Manathrust']=[1, 'Mana']; SPELL['Remove Curses']=[20, 'Mana']; SPELL['Elemental Shield']=[20, 'Mana']; SPELL['Disruption Shield']=[35, 'Mana']; SPELL['Psionic blast']=[1, 'MIntrusion']; SPELL['Scare']=[1, 'MIntrusion']; SPELL['Confuse']=[3, 'MIntrusion']; SPELL['Hypnosis']=[5, 'MIntrusion']; SPELL['Drain strength']=[7, 'MIntrusion']; SPELL['Psychic Suppression']=[10, 'MIntrusion']; SPELL['Psi Storm']=[18, 'MIntrusion']; SPELL['Remote Vision']=[20, 'MIntrusion']; SPELL['Charm']=[33, 'MIntrusion']; SPELL['Recharge']=[5, 'Meta']; SPELL['Project Spells']=[10, 'Meta']; SPELL['Disperse Magic']=[15, 'Meta']; SPELL['Confuse']=[5, 'Mind']; SPELL['Stun']=[15, 'Mind']; SPELL['Sense minds']=[30, 'Mind']; SPELL['Telekenisis I']=[30, 'Mind']; SPELL['Grow trees']=[6, 'Nature']; SPELL['Healing']=[10, 'Nature']; SPELL['Recover']=[15, 'Nature']; SPELL['Vermin control']=[15, 'Nature']; SPELL['Regeneration']=[20, 'Nature']; SPELL['Focus']=[1, 'Druid_Physical']; SPELL['Herbal Tea']=[3, 'Druid_Physical']; SPELL['Quick Feet']=[13, 'Druid_Physical']; SPELL['Extra Growth']=[15, 'Druid_Physical']; SPELL['Forests Embrace']=[18, 'Druid_Physical']; SPELL['Psychokenesis']=[3, 'PPower']; SPELL['AutoKenesis I']=[5, 'PPower']; SPELL['AutoKenesis II']=[16, 'PPower']; SPELL['Feeback']=[18, 'PPower']; SPELL['Pyrokenesis']=[20, 'PPower']; SPELL['AutoKenesis III']=[24, 'PPower']; SPELL['Cryokenesis']=[24, 'PPower']; SPELL['Psychic Warp']=[30, 'PPower']; SPELL['TeleKenisis II']=[35, 'PPower']; SPELL['Kenetic Shield']=[40, 'PPower']; SPELL['Mage Lock']=[1, 'Temporal']; SPELL['Slow Monster']=[10, 'Temporal']; SPELL['Essence of Speed']=[15, 'Temporal']; SPELL['Banishment']=[30, 'Temporal']; SPELL['Clear Mind']=[3, 'TContact']; SPELL['Willpower']=[3, 'TContact']; SPELL['Self-reflection']=[15, 'TContact']; SPELL['Accellorate Nerves']=[20, 'TContact']; SPELL['Telepathy']=[20, 'TContact']; SPELL['Recognition']=[25, 'TContact']; SPELL['Stabilise Thoughts']=[25, 'TContact']; SPELL['Telekenesis II']=[35, 'TContact']; SPELL['Hellfire']=[20, 'Udun']; SPELL['Genocide']=[25, 'Udun']; SPELL['Wraithform']=[35, 'Udun']; SPELL['Disenchantment Bolt']=[40, 'Udun']; SPELL['Vapor']=[2, 'Water']; SPELL['Ents Potion']=[6, 'Water']; SPELL['Tidal Wave']=[16, 'Water']; SPELL['Ice Storm']=[22, 'Water'];

BODYFORM['Cave bear']=[5,'Druid']; BODYFORM['Panther']=[5,'Druid']; BODYFORM['Grizzly bear']=[10,'Druid']; BODYFORM['Yeti']=[10,'Druid']; BODYFORM['Griffon']=[15,'Druid']; BODYFORM['Sasquatch']=[15,'Druid']; BODYFORM['Werebear']=[20,'Druid']; BODYFORM['Great eagle']=[20,'Druid']; BODYFORM['Great white shark']=[20,'Druid']; BODYFORM['Aranea']=[20,'Druid']; BODYFORM['Wyvern']=[25,'Druid']; BODYFORM['Multi-hued Hound']=[25,'Druid']; BODYFORM['5-headed hydra']=[30,'Druid']; BODYFORM['Minotaur']=[30,'Druid']; BODYFORM['Giant squid']=[30,'Druid']; BODYFORM['7-headed hydra']=[35,'Druid']; BODYFORM['Elder aranea']=[35,'Druid']; BODYFORM['Plasma hound']=[35,'Druid']; BODYFORM['11-headed hydra']=[40,'Druid']; BODYFORM['Giant Roc']=[40,'Druid']; BODYFORM['Lesser kraken']=[40,'Druid']; BODYFORM['Maulotaur']=[45,'Druid']; BODYFORM['Winged Horror']=[45,'Druid']; BODYFORM['Spectral Tyrannosaur']=[50,'Druid']; BODYFORM['Greater kraken']=[50,'Druid']; BODYFORM['Jabberwock']=[50,'Druid']; BODYFORM['Horned Serpent']=[55,'Druid']; BODYFORM['Firebird']=[60,'Druid']; BODYFORM['Master yeek']=[12, 'Wielding']; BODYFORM['Ogre']=[13, 'Wielding']; BODYFORM['Uruk']=[16, 'Wielding']; BODYFORM['Hill Giant']=[20, 'Wielding']; BODYFORM['Fire Giant']=[25, 'Wielding']; BODYFORM['Green Dragonrider']=[30, 'Wielding']; BODYFORM['Cloud Giant']=[31,'Wielding']; BODYFORM['Storm Giant']=[35,'Wielding']; BODYFORM['Collossus']=[35,'Wielding']; BODYFORM['Blue Dragonrider']=[40,'Wielding']; BODYFORM['Drolem']=[44,'Wielding']; BODYFORM['Seraph']=[45,'Wielding']; BODYFORM['Fallen Angel']=[49,'Wielding']; BODYFORM['Brown Dragonrider']=[50,'Wielding']; BODYFORM['Lesser Titan']=[50,'Wielding']; BODYFORM['Archon']=[55,'Wielding']; BODYFORM['Greater Titan']=[58,'Wielding']; BODYFORM['Bronze Dragonrider']=[60,'Wielding']; BODYFORM['Bone Golem']=[61,'Wielding']; BODYFORM['Bronze Golem']=[65,'Wielding']; BODYFORM['Gold Dragonrider']=[70,'Wielding']; BODYFORM['Novice Mage']=[2,'Mimic']; BODYFORM['Novice Ranger']=[4,'Mimic']; BODYFORM['Rotting Corpse']=[8,'Mimic']; BODYFORM['Tengu']=[10,'Mimic']; BODYFORM['Druid']=[13,'Mimic']; BODYFORM['Illusionist']=[13,'Mimic']; BODYFORM['Lizard Man']=[16,'Mimic']; BODYFORM['Dark-elven Lord']=[20,'Mimic']; BODYFORM['Dark-elven Warlock']=[23,'Mimic']; BODYFORM['Gargoyle']=[34,'Mimic']; BODYFORM['Halfling Slinger']=[35,'Mimic']; BODYFORM['Death Quasit']=[40,'Mimic']; BODYFORM['Master Lich']=[41,'Mimic']; BODYFORM['Vampire Lord']=[42,'Mimic']; BODYFORM['Lesser Black Reaver']=[45,'Mimic']; BODYFORM['Lesser Balrog']=[49,'Mimic']; BODYFORM['Demilich']=[54,'Mimic']; BODYFORM['Elder Vampire']=[54,'Mimic']; BODYFORM['Black Reaver']=[74,'Mimic']; BODYFORM['Greater Balrog']=[80,'Mimic']; BODYFORM['Poltergeist']=[3,'Shaman']; BODYFORM['Green Glutton Ghost']=[5,'Shaman']; BODYFORM['Phantom Warrior']=[8,'Shaman']; BODYFORM['Air Spirit']=[12,'Shaman']; BODYFORM['Moaning Spirit']=[12,'Shaman']; BODYFORM['Umber Hulk']=[16,'Shaman']; BODYFORM['Dreadmaster']=[44,'Shaman']; BODYFORM['Dreadlord']=[62,'Shaman']; BODYFORM['Ancient Blue|Bronze dragons']=[40,'Weaponless']; BODYFORM['Ancient White|Green dragons']=[40,'Weaponless']; BODYFORM['Ancient Black|Red|Gold dragons']=[41,'Weaponless']; BODYFORM['Ancient Multihued Dragon']=[51,'Weaponless']; BODYFORM['Great Storm|Swamp|Ice Wyrms']=[63,'Weaponless']; BODYFORM['Wyrm of Perplexity']=[63,'Weaponless']; BODYFORM['Wyrm of Radiance']=[63,'Weaponless']; BODYFORM['Hell|Bile|Thunder Wyrms']=[67,'Weaponless']; BODYFORM['Chaos|Law Wyrms']=[75,'Weaponless']; BODYFORM['Balance|Many Coloured Wyrms']=[80,'Weaponless']; BODYFORM['Power Wyrm']=[85,'Weaponless']; BODYFORM['Cave Spider']=[2,'Armless']; BODYFORM['Light|Dark Hounds']=[15,'Armless']; BODYFORM['Fire|Cold Hounds']=[18,'Armless']; BODYFORM['Energy|Earth Hounds']=[20,'Armless']; BODYFORM['Acid|Air Hounds']=[20,'Armless']; BODYFORM['Phase Spider']=[20,'Armless']; BODYFORM['Vibration|Nexus Hounds']=[27,'Armless']; BODYFORM['Multihued Hound']=[33,'Armless']; BODYFORM['Gravity|Inertia|Impact Hounds']=[35,'Armless']; BODYFORM['Nether|Time|Plasma Hounds']=[51,'Armless'];

var PRACE = [];
var PCLASS = [];
EOM

my $RACE = join "|", (keys %races_TOKEN);
my $CLASS = join "|", (keys %classes_TOKEN);
my %RACE_DONE = ();

my $current_race;
my $current_class;
my $s, $m, $v, $H;
my $e = 0;


my $DOING_RACES = 1;
while(<>) {
	next if (/^\s*$/);
	if (/player_race/) {
		print "function initialize_prace() {\n";
		$DOING_RACES = 1;
	}
	if ($DOING_RACES) {
		if (/"($RACE)"/) {
			$current_race = $races_TOKEN{$1};
			if ($current_race eq "RACE_DIVINE") {
				print "\tPRACE['RACE_DIVINE1'] = [];\n" if (!$RACE_DONE{$current_race});
				print "\tPRACE['RACE_DIVINE2'] = [];\n" if (!$RACE_DONE{$current_race});
			} else {
				$H = "PRACE['$current_race']";
				print "\tPRACE['$current_race'] = [];\n" if (!$RACE_DONE{$current_race});
			}
			$RACE_DONE{$current_race} = 1;
		} elsif (/(SKILL_.*),/) {
			$s = $1;
		} elsif (!$e and /'(.)',\s*(\d+),/) {
			$m = $2; $e = 1;
		} elsif ($e and /'(.)',\s*(\d+),/) {
			$v = $2; $e = 0;
			if ($current_race eq "RACE_DIVINE") {
				if ($s =~ /(HOFFENSE|HDEFENSE|HCURING|HSUPPORT)/)  {
					print "\tPRACE['RACE_DIVINE1']['$s'] = [0, 0, 70*2.1];\n";
					print "\tPRACE['RACE_DIVINE2']['$s'] = [0, 0, -1];\n";

				} elsif ( $s =~ /(NECROMANCY|TRAUMATURGY)/) {
					print "\tPRACE['RACE_DIVINE1']['$s'] = [0, 0, -1];\n";
					print "\tPRACE['RACE_DIVINE2']['$s'] = [0, 0, 70*3];\n"; 

				} elsif ( $s =~ /(FEAR|SHIVER)/) {
					print "\tPRACE['RACE_DIVINE1']['$s'] = [0, 0, 70*3];\n";
					print "\tPRACE['RACE_DIVINE2']['$s'] = [0, 0, 70*3];\n"; 

				} elsif ( $s =~ /(DEATH)/) {
					print "\tPRACE['RACE_DIVINE1']['$s'] = [0, 0, -1];\n";
					print "\tPRACE['RACE_DIVINE2']['$s'] = [0, 0, 70*3];\n"; 

				} elsif ( $s =~ /(SNEAKINESS|STEALTH)/) {
					print "\tPRACE['RACE_DIVINE1']['$s'] = [0, 0, 110];\n"; 
					print "\tPRACE['RACE_DIVINE2']['$s'] = [0, 0, 110];\n"; 


				} else { 
					if ($1 eq '+' ) {
						print "\tPRACE['RACE_DIVINE1']['$s'] = [$m, $v, 0];\n";
						print "\tPRACE['RACE_DIVINE2']['$s'] = [$m, $v, 0];\n";
					} elsif ($1 eq '%') { 
						print "\tPRACE['RACE_DIVINE1']['$s'] = [$m, 0, $v];\n";
						print "\tPRACE['RACE_DIVINE2']['$s'] = [$m, 0, $v];\n";
					} 

				}
			} else {
				if ($1 eq '+' ) {
					print "\t${H}['$s'] = [$m, $v, 0];\n";
				} elsif ($1 eq '%') { 
					print "\t${H}['$s'] = [$m, 0, $v];\n";
				} 
			}
#TODO: SPECIAL DIVINE SECTION
		} elsif (/player_class/) {
print <<EOM; #special divine section

	PRACE['RACE_DIVINE1']['SKILL_DIVINATION'] = [0, 0, 170];
	PRACE['RACE_DIVINE1']['SKILL_POLEARM'] = [0, 0, 130];
	PRACE['RACE_DIVINE1']['SKILL_BLUNT'] = [0, 0, 130];
	PRACE['RACE_DIVINE1']['SKILL_SWORD'] = [0, 0, 130];
	PRACE['RACE_DIVINE1']['SKILL_R_LITE'] = [0, 0, 200];
	PRACE['RACE_DIVINE1']['SKILL_R_MANA'] = [0, 0, 200];

	PRACE['RACE_DIVINE2']['SKILL_R_DARK'] = [0, 0, 200];
	PRACE['RACE_DIVINE2']['SKILL_R_NETH'] = [0, 0, 200];
	PRACE['RACE_DIVINE2']['SKILL_FIRE'] = [0, 0, 170];
	PRACE['RACE_DIVINE2']['SKILL_AIR'] = [0, 0, 170];
	PRACE['RACE_DIVINE2']['SKILL_CONVEYANCE'] = [0, 0, 170]; 
	PRACE['RACE_DIVINE2']['SKILL_UDUN'] = [0, 0, 200];
	PRACE['RACE_DIVINE2']['SKILL_MARTIAL_ARTS'] = [0, 0, 130];
	PRACE['RACE_DIVINE2']['SKILL_AXE'] = [0, 0, 130]; 
EOM
			$current_race = "";
			print "}\nfunction initialize_pclass() {\n";
			$DOING_RACES = 0;
		}
	} else {
		if (/"($CLASS)"/) {
			$current_class = $classes_TOKEN{$1};
			$H = "PCLASS['$current_class']";
			print "\tPCLASS['$current_class'] = [];\n" if (!$CLASS_DONE{$current_class});
			$CLASS_DONE{$current_class} = 1;
		} elsif (/(SKILL_.*),/) {
			$s = $1;
		} elsif (!$e and /'(.)',\s*(\d+),/) {
			$m = $2; $e = 1;
		} elsif ($e and /'(.)',\s*(\d+),/) {
			$v = $2; $e = 0;
			if (/'(.)',\s*(\d+),/) {
				$v = $2;
				if ($1 eq '+' ) {
					print "\t${H}['$s'] = [$m, $v, 0];\n";
				} elsif ($1 eq '%') { 
					print "\t${H}['$s'] = [$m, 0, $v];\n";
				}
			} else {
				warn "Unexpected error: malformed skill lines detected\n";
			}
		} elsif (//) {
		} elsif (//) {
		} elsif (//) {
		} elsif (//) {
		} elsif (//) {
		}
	}
}
print <<'EOM';
}


var prev_prace = -1; var prev_pclass = -1;

function refresh(force) {
	if (!force && prev_prace == $('#race').val() && prev_pclass == $('#class').val()) return;
	
	if (force) required_level = 0;

	if ($('#race').val() == "RACE_DIVINE") {

	} else {
	}
	var prace = $('#race').val();
	var pclass = $('#class').val();

	prev_prace = prace;
	prev_pclass = pclass;

	for (var skill in SKILLS) {
		var race_val = 0;
		var race_mod = 0;
		var race_x = 0;
		var undef = 0;
		if (typeof(PRACE[prace][skill]) != 'undefined') {
			race_x = PRACE[prace][skill][2];
			if (race_x == -1) {
				race_val = 0;
				race_mod = 0;
			} else {
				race_x = race_x/100;
				race_val = PRACE[prace][skill][0];
				race_mod = PRACE[prace][skill][1];
			}
		} else {
			undef = 1;
		}
		if (race_x == 0) race_x = 1;
		if (prace == 'RACE_VAMPIRE' && skill == 'SKILL_ANTIMAGIC') race_x = 0;
		if (prace == 'RACE_VAMPIRE' && skill == 'SKILL_BLUNT') race_x = 0;
		var class_val = 0;
		var class_mod = 0;
		var class_x = 0;
		if (typeof(PCLASS[pclass][skill]) != 'undefined') {
			class_x = PCLASS[pclass][skill][2];
			if (class_x == -1) {
				class_val = 0;
				class_mod = 0;
			} else {
				class_x = class_x/100;
				class_val = PCLASS[pclass][skill][0];
				class_mod = PCLASS[pclass][skill][1];
			}
			undef = 0;
		} 
		
		if (class_x == 0) class_x = 1;

		if (undef || (race_mod == 0 && class_mod == 0) || race_x == -1 || class_x == -1) {
			TREE_BASE[skill] = 0;
			TREE_MOD[skill] = 0;

			$('#'+skill).css('background', 'darkgrey');
			$('#'+skill).css('display', 'none');
			if (skill == "SKILL_ARCHERY") {
				if ($('#class').val() != "CLASS_MAGE" &&
				    $('#class').val() != "CLASS_PRIEST" ) {
					$('#'+skill).css('background', 'darkgrey');
					$('#'+skill).css('display', 'inline');
				}
			}
		} else { 
			TREE_BASE[skill] = Math.round(race_val + class_val);
			TREE_MOD[skill] = Math.round((race_mod + class_mod) * class_x * race_x);
			if ($('#race').val() == 'RACE_DIVINE1' || 
			    $('#race').val() == 'RACE_DIVINE2') 
				if(TREE_MOD[skill] > 2000) 
					TREE_MOD[skill] = 2000;

			if (race_x > 1.0) {
				$('#'+skill+'_MOD').css('background', 'lightgreen'); 
			} else if (race_x < 1.0) {
				$('#'+skill+'_MOD').css('background', 'khaki'); 
			} else {
				$('#'+skill+'_MOD').css('background', 'white'); 
			}

			if (race_val > 0.0) {
				$('#'+skill+'_VAL').css('background', 'lightgreen'); 
			} else if (race_val < 0.0) {
				$('#'+skill+'_VAL').css('background', 'khaki'); 
			} else {
				$('#'+skill+'_VAL').css('background', 'white'); 
			}

			$('#'+skill).css('background', 'white'); 
			$('#'+skill).css('display', 'inline');
		}
		TREE_SPENT[skill] = 0;


		TREE_CHILDREN[skill] = 0;

		TREE_TOTAL[skill] = TREE_SPENT[skill] * TREE_MOD[skill] + TREE_BASE[skill];

		var T = TREE_TOTAL[skill]; if (T > 50000) T = 50000;
		$('#'+skill+'_VAL').html((T/1000).toFixed(3));
		$('#'+skill+'_MOD').html((TREE_MOD[skill]/1000).toFixed(3));
		
		skill_points_used = 0;
		update();
	}
}
function v(s) {
	return TREE_TOTAL['SKILL_'+s];
}
function summarize(t) {
	var my_t = '';
	var s = '';
	if (t != '')  {
		my_t = '<table><tr class="nc"><td>skill</td><td>spent</td><td>total</td></tr>';
		my_t += t;
		my_t += '</table>';
	}

	my_spells = '';
	for (var key in SPELL) {
		my_spells+=get_spell_advert(key);
	} 
	if (my_spells != '') my_t += 'Available spells (spell level):<br/>' + my_spells + '<br/>';

	var pclass=$('#class').val();
	if (pclass=='CLASS_DRUID')
	{
		my_t += 'Druid forms (level):<br/>';
		for (var key2 in BODYFORM)
		{
			my_t+=get_form_advert(key2,'Druid');
		}
		my_t += '<br/>';
	} 
	if ((pclass=='CLASS_MIMIC' || pclass=='CLASS_SHAMAN' || pclass=='CLASS_ADVENTURER') && v('MIMIC')>=1000)
	{
		my_t += 'Notable wielding forms (kills):<br/>';
		for (var key2 in BODYFORM)
		{
			my_t+=get_form_advert(key2,'Wielding');
		}
		my_t += '<br/>';
		
		if (pclass!='CLASS_SHAMAN')
		{
			my_t += 'Useful non-shaman forms (kills):<br/>';
			for (var key2 in BODYFORM)
			{
				my_t+=get_form_advert(key2,'Mimic');
			}
			my_t += '<br/>';
		}
		else
		{
			my_t += 'Special shaman forms (kills):<br/>';
			for (var key2 in BODYFORM)
			{
				my_t+=get_form_advert(key2,'Shaman');
			}
			my_t += '<br/>';
		}
		if (v('MARTIAL_ARTS')>1000)
		{
			my_t += 'Forms for martial artists (kills):<br/>';
			for (var key2 in BODYFORM)
			{
				my_t+=get_form_advert(key2,'Weaponless');
			}
			my_t += '<br/>';
			
			my_t += 'Gloveless MA forms (kills):<br/>';
			for (var key2 in BODYFORM)
			{
				my_t+=get_form_advert(key2,'Armless');
			}
			my_t += '<br/>';
		}
	}

	if (v('CLIMB') == 1000) {
		my_t += '<p>(Climb) You can climb mountains</p>';
	}
	if (v('SWIM') == 1000) {
		my_t += '<p>(Swim) You can swim</p>';
	}
	s = 'MARTIAL_ARTS';
	if (v(s) >= 1000) {
		var bpr = 1;
		my_t += '<p><ul>Martial Arts bonus(es):<ul>';
		if (v(s) >= 10000) {
			my_t += '<li>Levitation</li>';
			bpr++;
		}
		if (v(s) >= 15000) {
			my_t += '<li>Fearless</li>';
			bpr++;
		}
		if (v(s) >= 20000) {
			my_t += '<li>Confusion Resistance</li>';
			bpr++;
		}
		if (v(s) >= 25000) {
			my_t += '<li>Free Action</li>';
		}
		if (v(s) >= 30000) {
			my_t += '<li>Swimming ability</li>';
			bpr++;
		}
		if (v(s) >= 40000) {
			my_t += '<li>Climbing ability</li>';
			bpr++;
		}
		if (v(s) >= 45000) {
			bpr++;
		}
		if (v(s) >= 50000) {
			my_t += '<li>Flight</li>';
			bpr++
		}
		my_t += '<li>'+bpr+' extra blows per round</li>';
		my_t += '</ul></p>';
	}
	s = 'EARTH';
	if (v(s) >= 30000) {
		my_t += '<p>(Earth) You resist shards</p>';
	}
	if (v(s) >= 45000) {
		my_t += '<p>(Earth) You resist earthquakes</p>';
	}

	s = 'AIR';
	if (v(s) >= 30000) {
		my_t += '<p>(Air) You land gently</p>';
	}
	if (v(s) >= 40000) {
		my_t += '<p>(Air) You resist poison</p>';
	}
	if (v(s) >= 50000) {
		my_t += '<p>(Air) You can fly</p>';
	}

	s = 'WATER';
	if (v(s) >= 50000) {
		my_t += '<p>(Water) You are immune to water</p>';
	} else if (v(s) >= 30000) {
		my_t += '<p>(Water) You resist water</p>';
	} 
	if (v(s) >= 40000) {
		my_t += '<p>(Water) You can swim</p>';
	}
	
	s = 'FIRE';
	if (v(s) >= 50000) {
		my_t += '<p>(Fire) You are immune to fire</p>';
	} else if (v(s) >= 30000) {
		my_t += '<p>(Fire) You resist fire</p>';
	} 

	if (v('MANA') >= 40000) {
		my_t += '<p>(Mana) You resist magical attacks</p>';
	}

	if (v('CONVEYANCE') >= 30000) {
		my_t += '<p>(Conveyance) You resist teleportation attacks</p>';
	}

	if (v('DIVINATION') >= 50000) {
		my_t += '<p>(Divination) You can identify objects easily</p>';
	}

	s = 'NATURE';
	if (v(s) >= 30000) {
		my_t += '<p>(Nature) You regenerate health faster</p>';
		my_t += '<p>(Nature) You can pass through trees</p>';
	}
	if (v(s) >= 40000) {
		my_t += '<p>(Nature) You can swim</p>';
	}

	s = 'MIND';
	if (v(s) >= 30000) {
		my_t += '<p>(Mind) You feel strong against confusion and hallucinations</p>';
	}
	if (v(s) >= 40000) {
		my_t += '<p>(Mind) You have a hold to your sanity</p>';
	} else if (v(s) >= 50000) {
		my_t += '<p>(Mind) You have a stronger hold to your sanity</p>';
	}

	if (v('TEMPORAL') >= 50000) {
		my_t += '<p>(Temporal) You resist time</p>';
	}

	s = 'UDUN';
	if (v(s) >= 30000) {
		my_t += '<p>(Udun) You resist teleportation attacks</p>';
	}
	if (v(s) >= 40000) {
		my_t += '<p>(Udun) You have a strong hold on your life force</p>';
	}

	s = 'HOFFENSE';
	if (v(s) >= 50000) {
		my_t += '<p>(H. Offense) You do extra damage to evil</p>';
	} else {
		if (v(s) >= 30000) {
			my_t += '<p>(H. Offense) You do extra damage to undeads</p>';
		}
		if (v(s) >= 40000) {
			my_t += '<p>(H. Offense) You do extra damage to demons</p>';
		} 
	}

	s = 'HDEFENSE';
	if (v(s) >= 50000) {
		my_t += '<p>(H. Defense) You are protected against evil</p>';
	} else {
		if (v(s) >= 30000) {
			my_t += '<p>(H. Defense) You are protected against undeads</p>';
		}
		if (v(s) >= 40000) {
			my_t += '<p>(H. Defense) You are protected against demons</p>';
		} 
	}

	s = 'HCURING';
	if (v(s) >= 30000) {
		my_t += '<p>(H. Curing) You resist blindness and poison</p>';
	}
	if (v(s) >= 40000) {
		my_t += '<p>(H. Curing) You resist stuns and cuts</p>';
	}
	if (v(s) >= 50000) {
		my_t += '<p>(H. Curing) You resist black breath and hallucinations</p>';
	}

	s = 'HSUPPORT';
	if (v(s) >= 40000) {
		my_t += '<p>(H. Support) You do not require food</p>';
	} 
	if (v(s) >= 50000) {
		my_t += '<p>(H. Support) You are immune to ancient curses</p>';
	}

	s = 'SWORD';
	if (v(s) >= 50000) {
		my_t += '<p>(Sword) You have 2 extra blows per round</p>';
	} else if (v(s) >= 25000) {
		my_t += '<p>(Sword) You have an extra blow per round</p>';
	}

	s = 'BLUNT';
	if (v(s) >= 50000) {
		my_t += '<p>(Blunt) You have 2 extra blows per round</p>';
	} else if (v(s) >= 25000) {
		my_t += '<p>(Blunt) You have an extra blow per round</p>';
	}

	s = 'AXE';
	if (v(s) >= 50000) {
		my_t += '<p>(Axe) You have 2 extra blows per round</p>';
	} else if (v(s) >= 25000) {
		my_t += '<p>(Axe) You have an extra blow per round</p>';
	}

	s = 'POLEARM';
	if (v(s) >= 50000) {
		my_t += '<p>(Polearm) You have 2 extra blows per round</p>';
	} else if (v(s) >= 25000) {
		my_t += '<p>(Polearm) You have an extra blow per round</p>';
	}

	if (v('ARCHERY') >= 50000) {
		my_t += '<p>(Archery) Your shots gain an extra power per shot</p>';
	}

	s = 'BOW';
	if (v(s) >= 50000) {
		my_t += '<p>(Bow) You have four extra shots per round</p>';
	} else if (v(s) >= 37500) {
		my_t += '<p>(Bow) You have three extra shots per round</p>'; 
	} else if (v(s) >= 25000) {
		my_t += '<p>(Bow) You have two extra shots per round</p>';
	} else if (v(s) >= 12500) {
		my_t += '<p>(Bow) You have an extra shot per round</p>';
	}

	s = 'SLING';
	if (v(s) >= 50000) {
		my_t += '<p>(Sling) You have five extra shots per round</p>';
	} else if (v(s) >= 40000) {
		my_t += '<p>(Sling) You have four extra shots per round</p>'; 
	} else if (v(s) >= 30000) {
		my_t += '<p>(Sling) You have three extra shots per round</p>';
	} else if (v(s) >= 20000) {
		my_t += '<p>(Sling) You have two extra shots per round</p>';
	} else if (v(s) >= 10000) {
		my_t += '<p>(Sling) You have an extra shot per round</p>';
	}

	s = 'XBOW';
	if (v(s) >= 50000) {
		my_t += '<p>(Crossbow) You have two extra shots with double the power per round</p>';
	} else if (v(s) >= 25000) {
		my_t += '<p>(Crossbow) You have an extra shot with extra power per round</p>'; 
	}
	
	s = 'BOOMERANG';
	if (v(s) >= 50000) {
		my_t += '<p>(Boomerang) You have three extra shots per round</p>';
	} else if (v(s) >= 33300) {
		my_t += '<p>(Boomerang) You have two extra shots per round</p>'; 
	} else if (v(s) >= 16600) {
		my_t += '<p>(Boomerang) You have an extra shot per round</p>'; 
	}



	$('#summary').html(my_t);
}
function parse_build() {
	if (has_parse == 1) return;
	try {

		var build=location.href.match(/\?b=(.*)$/)[1];
		var URL = build.split("|");
		var MY_RACE = URL[0];
		var MY_CLASS = URL[1];
		var MY_BUILD = URL[2].substring(1);


		$('#race').val(RACES[MY_RACE]);
		$('#class').val(CLASSES[MY_CLASS]);
		refresh();

		var c_index = 0; var c_0 = 0; var current = 0;
		for (var skill in SKILLS) {
			if (c_0-- > 1) continue;
			if (c_index >= MY_BUILD.length) break;
			
			current = MY_BUILD.substring(c_index, 2 + c_index);
			c_index+=2;

			if (current.charAt(0) == '-') {
				do {
					current = current + '' + MY_BUILD.substring(c_index, 1 + c_index);
				} while(MY_BUILD.charAt(c_index++) != '-');
				c_0 = parseInt(current.substring(1, current.length-1), 10);
			} else {
				var t = parseInt(current,32);
				while (t > 0 && increase(skill, true)) t--;  
			}
		}
	} catch(err) { }
	update();
	has_parse = 1;
}
function update_build() {
	var i;
	for (i = 0; i < RACES.length; i++) {
		if (RACES[i] == $('#race').val())
			break; 
	}
	build = i + '|';
	for (i = 0; i < CLASSES.length; i++) {
		if (CLASSES[i] == $('#class').val())
			break; 
	}
	build += i + '|';

	var num = '1';

	var prev_0 = 0;
	for (var skill in SKILLS) {
		var x = Number(TREE_SPENT[skill]).toString(32);
		if (x != 0) {
			if (x.length == 1) x = '0' + x;

			if (prev_0 > 0) {
				num = num + '-' + prev_0 + '-';
				prev_0 = 0;
			}
			num = num + '' + x;
		} else {
			prev_0 ++;
		}
	}
	try {
		window.history.pushState({}, 
		  'tomenet.ielf.org - Generic Skill Builder', 
		  'skill_builder.php?b=' + build+num);
	} catch(err){ } 
}
function min(a, b) { if (a < b) return a; return b; }

function update() {
	if (has_parse == 1) {
		update_build();
	}
	var max_skill = 0; var off = "";
	var t = "";
	for (var skill in SKILLS) {
		var T = min(50000, TREE_MOD[skill] * TREE_SPENT[skill] + TREE_BASE[skill]);
		if (TREE_SPENT[skill] > 0) {
			t += "<tr><td>" + skill + "</td><td>" + TREE_SPENT[skill] + "</td><td>" + min(50, (TREE_TOTAL[skill]/1000)).toFixed(3) + "</td></tr>";

			if (TREE_MOD[skill] > 1000) {
				var prev = TREE_TOTAL[skill] - TREE_MOD[skill];
				var diff = Math.floor(TREE_TOTAL[skill]/1000) - Math.floor(prev/1000);
				if (diff == 2) {
					T -= 1000;
				}
			}
			if (T > max_skill) {


				max_skill = T;
				off = skill;
			}

		}
	}

	var max_level_pts = Math.ceil(skill_points_used/5) + 1;
	var max_level_skill = Math.floor(max_skill/1000) - 2;

	var s = "<p class=\"highlight\">You have used <span class=\"highlight\">" + skill_points_used + "</span> skill point" + ((skill_points_used>1)?"s.":".");

	if (max_level_pts < max_level_skill) {
		s += " The level requirement is <span class=\"highlight\">" + max_level_skill + "</span> due to <span class=\"highlight\">" + off + "</span>.";
		if (skill_points_used != 0) {
			var pts_left = ((max_level_skill-1)*5-skill_points_used);
			s += " You have <span class=\"highlight\">" + pts_left + "</span> skill point" + ((pts_left>1)?"s":"")   + " left.";
			required_level=max_level_skill;
		}
	} else {
		s += " The level requirement is <span class=\"highlight\">" + max_level_pts + "</span>.";
		if (skill_points_used != 0) {
			var pts_left = ((max_level_pts-1)*5-skill_points_used);
			s += " You have <span class=\"highlight\">" + pts_left + "</span> skill point" + ((pts_left>1)?"s":"")  + " left.";
			required_level=max_level_pts;
		}
	}

	s += '<div id="einfo" name="einfo">';
	s += get_race_advert($('#race').val());
	s += get_class_advert($('#class').val());
	s += '<hr style="width: 400px; margin-left: 1em"/>';
	s += '</div>';

	$('#update').html(s);
	summarize(t);
}

var skill_points_used = 0;
var TREE_BASE  = [];
var TREE_MOD   = [];
var TREE_SPENT = [];
var TREE_TOTAL = []; //not needed? it's mod*spent + base (+ children trickle) ; KEEP ANYWAY
var TREE_CHILDREN = [];

var FLAGS = []; //eye candy stuff; GREEN == favourable; AMBER == penalized
function increase(s, silent) { 
	if (TREE_TOTAL[s] >= 50000 || TREE_MOD[s] == 0 || s == '') {
		return false;
	}

	if ($('#class').val()== 'CLASS_RANGER' && s == 'SKILL_ARCHERY' && TREE_TOTAL[s] >= 10000) return false;

	if (s == 'SKILL_SWIM' && TREE_TOTAL[s] >= 1000) return false;
	if (s == 'SKILL_CLIMB' && TREE_TOTAL[s] >= 1000) return false;

	if (typeof(TREE_SPENT[s]) != 'undefined') {
		TREE_SPENT[s]++;
	} else {
		TREE_SPENT[s] = 1;
	}

	
	TREE_TOTAL[s] = TREE_SPENT[s] * TREE_MOD[s] + TREE_BASE[s] + TREE_CHILDREN[s];
	
	if (typeof(FRIENDLY[s]) != 'undefined') {
		for (var i = 0 ; i < FRIENDLY[s].length/2; i++ ) {
			var P = FRIENDLY[s][2*i];
			var M = FRIENDLY[s][2*i+1];
			TREE_CHILDREN[P] += M*TREE_MOD[P]/100;
			TREE_TOTAL[P] = TREE_SPENT[P] * TREE_MOD[P] + TREE_BASE[P] + TREE_CHILDREN[P];

			var T = TREE_TOTAL[P]; if (T > 50000) T = 50000;
			if ($('#class').val()== 'CLASS_RANGER' && P == 'SKILL_ARCHERY' && T >= 10000) T = 10000;

			if (TREE_SPENT[P] > 0) {
				$('#'+P+'_VAL').html((T/1000).toFixed(3) + "(<span class=\"highlight\">" + TREE_SPENT[P] + "</span>)");
			} else {
				$('#'+P+'_VAL').html((T/1000).toFixed(3));
			}
		}
	}

	var T = TREE_TOTAL[s]; if (T > 50000) T = 50000;
	if ($('#class').val()== 'CLASS_RANGER' && s == 'SKILL_ARCHERY' && T >= 10000) T = 10000;

	if (TREE_SPENT[s] > 0) {
		$('#'+s+'_VAL').html((T/1000).toFixed(3) + "(<span class=\"highlight\">" + TREE_SPENT[s] + "</span>)");
	} else {
		$('#'+s+'_VAL').html((T/1000).toFixed(3));
	}

	skill_points_used++;
	if (!silent) update();
	return true;
}

function decrease(s, silent) {
	if (TREE_SPENT[s] == 0 || TREE_TOTAL[s] <= TREE_BASE[s] || TREE_MOD[s] == 0) {
		return false;
	}
	if (typeof(TREE_SPENT[s]) != 'undefined') {
		TREE_SPENT[s]--;
	} else {
		return false;
	}

	TREE_TOTAL[s] = TREE_SPENT[s] * TREE_MOD[s] + TREE_BASE[s] + TREE_CHILDREN[s];

	if (typeof(FRIENDLY[s]) != 'undefined') {
		for (var i = 0 ; i < FRIENDLY[s].length/2; i++ ) {
			var P = FRIENDLY[s][2*i];
			var M = FRIENDLY[s][2*i+1];
			TREE_CHILDREN[P] -= M*TREE_MOD[P]/100;
			TREE_TOTAL[P] = TREE_SPENT[P] * TREE_MOD[P] + TREE_BASE[P] + TREE_CHILDREN[P];

			var T = TREE_TOTAL[P]; if (T > 50000) T = 50000;
			if ($('#class').val()== 'CLASS_RANGER' && P == 'SKILL_ARCHERY' && T >= 10000) T = 10000;

			if (TREE_SPENT[P] > 0) {
				$('#'+P+'_VAL').html((T/1000).toFixed(3) + "(<span class=\"highlight\">" + TREE_SPENT[P] + "</span>)");
			} else {
				$('#'+P+'_VAL').html((T/1000).toFixed(3));
			}
		}
	}

	var T = TREE_TOTAL[s]; if (T > 50000) T = 50000;
	if ($('#class').val()== 'CLASS_RANGER' && s == 'SKILL_ARCHERY' && T >= 10000) T = 10000;

	if (TREE_SPENT[s] > 0) {
		$('#'+s+'_VAL').html((T/1000).toFixed(3) + "(<span class=\"highlight\">" + TREE_SPENT[s] + "</span>)");
	} else {
		$('#'+s+'_VAL').html((T/1000).toFixed(3));
	}

	skill_points_used--;
	if (!silent) update();
	return true;
}

function mass_dec(s) { var c = 9; while (decrease(s) && c > 0) { c--; }; }
function mass_inc(s) { var c = 9; while (increase(s) && c > 0) { c--; }; }

function minimize(s) { while (decrease(s)) { }; }
function maximize(s) { while (increase(s)) { }; }

function dump_points(skill) {
	var p = prompt("Please enter the number of skill points to add (negative values accepted)", "10");
	if (p == '' || p == null || isNaN(p)) return;
	if (p < 0) {
		while (p++ < 0) decrease(skill);
	} else {
		while (p-- > 0) increase(skill);
	}


}

function set_skill(skill, n) {
	if (n == 0) minimize(skill);
	if (n == 50) maximize(skill);
	if (TREE_MOD[skill] == 0) return;

	var diff = parseInt((n*1000 - TREE_TOTAL[skill])/1000);

	if (diff == 0) return;

	if (diff > 0) {
		while (TREE_TOTAL[skill] <= n*1000) { increase(skill); }
	} else {
		while (TREE_TOTAL[skill] >= n*1000) { decrease(skill); }
		if (n*1000 != TREE_TOTAL[skill]) //funky flooring different stepping math
			increase(skill);
	}
}

function get_race_advert(prace) {

    var s='';
	
	if (prace == 'RACE_HUMAN') s+='<h4>Human</h4><p> '+
	'Be a good allrounder with no special weaknesses or strengths.<br/>'+
	'Enjoy having no experience penalties. Level up fast! There are no racial adjustments.<br/>'+
	'Get a bonus on climbing and a large bonus on Interception.</p>';

	if (prace == 'RACE_HALF_ELF') s+='<h4>Half Elf</h4><p> '+
    'Be smarter and faster than humans, if not as strong.<br/>'+
    'Be slightly better at searching, disarming, saving throws,<br/>'+
    'stealth, bows, and magic, but not as good at hand weapons.<br/>'+
    'Resist light intrinsically.<br/>'+
    'Get a bonus on Bow-Mastery and Interception.</p>';

	if (prace == 'RACE_ELF') s+='<h4>Elf</h4><p> '+
    'Resist light effects intrinsically and see invisible creatures.<br/>'+
    'Make a better magician than humans, although not as good at fighting.<br/>'+
    'Be smarter and faster than either humans or half-elves. Be wiser.<br/>'+
    'Better at searching, disarming, perception, stealth, bows, and<br/>'+
    'magic. Not as good at hand weapons.<br/>'+
    'Bonus on Bow-Mastery, Magic, Stealth, Dodging, Calmness and Sneakiness.</p>';

	if (prace == 'RACE_HOBBIT') s+='<h4>Hobbit</h4><p> '+
    'Dexterity that is sustained. Appreciate a dexterity bonus from not wearing shoes.<br/>'+
    'Get very good at shooting and throwing, and have good saving throws.<br/>'+
	'Be very good at searching, disarming, perception, and stealth.<br/>'+
	'Make an excellent rogues if much weaker than humans, and no good<br/>'+
    'at melee fighting. See in the dark with infravision and resist black breath somewhat.<br/>'+
    'Get a bonus on Sling-Mastery, Sneakiness, Dodging and a large bonus on Stealth.<br/>'+
    'Train health to make up for low hit points, depending on your chosen class.</p>';

	if (prace == 'RACE_GNOME') s+='<h4>Gnome</h4><p> '+
    'Intrinsically protected from paralysis, make an excellent warlock or sorcerer, and<br/>'+
    'have very good saving throws. Be good at magic, searching, disarming,<br/>'+
    'perception, and stealth. Less strong than a human and poor with a hand weapon.<br/>'+
	'Get fair infra-vision. Enjoy a bonus on Crossbow-Mastery and Magic and a large bonus on<br/>'+
    'Dodging and Digging.</p>';

	if (prace == 'RACE_DWARF') s+='<h4>Dwarf</h4><p> '+
    'Can never be blinded. Travel across mountains at level 30.<br/>'+
	'Make an excellent warrior or priest.<br/>'+
	'Stronger and tougher but slower and less<br/>'+
    'intelligent than a human. Somewhat wise, resist spells cast on you.<br/>'
	'See well in the dark, and accept miserable stealth.<br/>'+
    'Bonus on Axe-Mastery and a huge bonus on Digging.</p>';

	if (prace == 'RACE_HALF_ORC') s+='<h4>Half Orc</h4><p> '+
    'Resist darkness intrinsically. Make an excellent warrior or<br/>'+
    'a decent priest. Be terrible at magic and accept that.<br/>'+
	'Bad at stealth, horrible at searching, <br/>'+
	'disarming, and perception. Be ugly but make a good rogue.<br/>'+
	'Have great constitution and lots of hit points!<br/>'+
    'Get a slight bonus on Backstabbing, a large bonus on Weaponmastery,<br/>'+
    'a bonus on Necromancy. Penalties on Magic and Sorcery.</p>';

	if (prace == 'RACE_HALF_TROLL') s+='<h4>Half Troll</h4><p> '+
    'Strength is sustained and very strong, if very stupid and slow.<br/>'+
	'Make a great warrior but an iffy priest. Bad at searching, disarming, '+
	'perception, and stealth. Ugly and always getting hungry.<br/>'+
    'Bonus on Blunt-Mastery, Health and Swimming. Penalty on Critical-Strike.'+
	'Large penalties on Archery, Magic and Sorcery.</p>';

	if (prace == 'RACE_DUNADAN') s+='<h4>Dunadain</h4><p> '+
    'Constitution is sustained. Hardy and surpassing human abilities in every<br/>'+
    'field, especially constitution. Levels are very hard to gain.<br/>'+
    'Get a bonus on Combat, Archery and Interception and a small bonus to Magic.</p>';

	if (prace == 'RACE_HIGH_ELF') s+='<h4>High Elf</h4><p> '+
    'See the invisible, resist light and the flow of time<br/>'+
    'intrinsically. Be a master of all skills, strong and intelligent.<br/>'
	'Wisdom is sometimes suspect. Experience is hard to gain.<br/>'+
    'Bonus on Bow-Mastery, Magic, Stealth, Dodging and a large bonus on Calmness.</p>';

	if (prace == 'RACE_YEEK') s+='<h4>Yeek</h4><p> '+
    'Intrinsic feather falling. Pass through dense forest quickly.<br/>'+
    'Try being the least powerful of all the races with disadvantages in all stats but<br/>'+
	'learn, and thus gain levels, extremely quickly.<br/>'+
	'Have attributes similar to humans.<br/>'+
    'Enhoy having no boni or mali on any skills.<br/>'+
    'Suffer low hit points but perhaps train health to make up for it, '+
	'depending on which class you choose to play.</p>';

	if (prace == 'RACE_GOBLIN') s+='<h4>Goblin</h4><p> '+
    'Be as sturdy as a dwarf and quite agile.<br/>'+
    'A good fighter, rogues, or mimics. Naturally resist darkness.<br/>'+
    'Get a bonus on Boomerang-Mastery and Stealing.</p>';

	if (prace == 'RACE_ENT') s+='<h4>Ent</h4><p> '+
    'Only eat occasionally, but learn to avoid fire!<br/>'+
	'Dont drown in water. Sense the presence of others, '+
	'animals at level 10, orcs at 15, trolls at 20, giants at 25,<br/>'+
    'dragons at 30, demons at 40, all evil-minded creatures at level 50.<br/>'+
    'See invisible things at level 4. Accumulate experience very slowly.<br/>'
	'Do not eat normal food but be able to consume liquids.<br/>'
	'Have trees slightly bend aside to let you pass through.<br/>'+
    'Slowly replenish nourishment by rooting into the ground.<br/>'+
	'Use resting mode on natural ground (grass, earth, mud or water).<br/>'
	'Resist unleashed water. Bonus to Health and a large bonus on Calmness and on the magic<br/>'+
    'schools Earth and Water. Large penalty on Fire school,<br/>'+
    'penalty on Axe-mastery and a small penalty on Sword-mastery.</p>';

	if (prace == 'RACE_DRIDER') s+='<h4>Draconian</h4><p> '+
    'Be a half-breed of dragon and man. Surpass common humans in all<br/>'+
    'ways, but accept poor stealth. Eat firestones to boost your powers.<br/>'+
    'Slow gaining experience, have the need to eat often. Feather fall instrinsically from birth.<br/>'+
    'ESP dragon at level 5. At level 6 get telepathic vision of all nearby creatures. ESP radius<br/>'+
    'expands with level. At level 30, learn how to levitate.<br/>'+
    'Susceptible to the void connecting void jump gates.<br/>'+
	'(May get hurt by it when travelling through it). <br/>'+
    'Possess a certain lineage trait from birth. Resistances and an elemental breath<br/>'+
	'(learned at level 8) Bonus on Attunement, Polearm-Mastery and<br/>'+
    'Magic devices.<br/>'+
    '<br/>'+
    '<p>Blue Lineage: Lightning Breath, brand (5), aura (15), immune (25)<\p>'+
    '<p>White Lineage: Frost Breath, aura (15), immune (25), susceptible to fire<\p>'+
    '<p>Red Lineage: Fire Breath, immune (25), susceptible to cold<\p>'+
    '<p>Black Lineage: Acid Breath, immune (25), <\p>'+
    '<p>Green Lineage: Poison Breath, immune (25), <\p>'+
    '<p>Multi-hued Lineage: Random Breath, restist lightning (5), frost (10), fire (15), acid (20), poison (25)<\p>'+
    '<p>Bronze Lineage: Confusion Breath, restist confusion (5), paralysis (10), reflection (20)<\p>'+
    '<p>Silver Lineage: Inertia Breath, restist  cold (5), poison (10), reflection (20)<\p>'+
    '<p>Golden Lineage: Sound Breath, restist  acid (5), sound (10), reflection (20)<\p>'+
    '<p>Law Lineage: Shards Breath, restist  shards (5), sound (15)<\p>'+
    '<p>Chaos Lineage: Chaos Breath, restist  confusion (5), chaos (15), disenchantment (20)<\p>'+
    '<p>Balance Lineage: Disenchantment Breath, restist disenchantment (10), sound (20)<\p>';

	if (prace == 'RACE_KOBOLD') s+='<h4>Kobold</h4><p> '+
    'Resist poison intrinsically. Be able to take most roles. '+
	'Be somewhat better at archery than close combat. Somewhat suspect intelligence.<br/>'
	'Can become a shaman or druid.<br/>'+
    'Infra-vision, sharp senses, move very silently, be hard to spot.'
	'Be good at disarming traps.<br/>'+
    'Get a bonus on Swimming and Trapping and a slight bonus on<br/>'+
    'Sneakiness.</p>';

	if (prace == 'RACE_DARK_ELF') s+='<p>(dark-elf) '+
    'Be a good fighter or sorceror, or a decent priest.<br/>'+
    'Intrinsically resist darkness, but be susceptible to light.<br/>'+
    'At level 20, learn to see the invisible.<br/>'+
    'Bonus on Stealth, Dodging, Sneakiness and Backstabbing.</p>';

	if (prace == 'RACE_VAMPIRE') s+='<h4>Vampire</h4><p> '+
    'Resist darkness, but fear the light.<br/>'+
    'Suseptible to purifying and anti-evil effects on items: Some <br/>'+
	'scrolls, magic devices, equipment, weapons<br/>'+
    'and light sources (may drain hit points if equipped).<br/>'+
    'Sun light and blessed light burns, draining hit points.<br/>'+
    'Determine close surroundings in complete darkness (growing with level).<br/>'+
	'Get a mummy wrapping to protect from sunlight.<br/>'+
    'Suffer less often from black breath infection and its consequences.<br/>'+
    'Good fighter or decent mage. Unable to<br/>'+
    'utilize magic of water or nature schools. Cant use mimicry techniques or holy spells.<br/>'+
    'Unable to suppress magic, but make use of items that provide antimagic effects.<br/>'+
    'Resist sanity-draining effects (somewhat),<br/>'+
    'time, nether, poison, and hard to drain your life force.<br/>'+
    'Get life leeching attacks.<br/>'+
    'At level 20, be able to turn into a bat. Bats are fast, can<br/>'+
    'fly (basically as effective as levitation) plus more resistant to sun<br/>'+
    'burn but move irraticly. Forsake all normal food and feed off living<br/>'+
    'creatures. Kill monsters in melee range to satisfy hunger.<br/>'+
    'Need less and less food at level 40. Hate Blunt weapons. Penalty on Divination magic school.<br/>'+
    'Bonus on Mental Intrusion. Large bonus on Necromancy<br/>'+
    'and Aura skills. Small bonus on Traumaturgy. Moderate skill bonus for Nether runes. <br/>'+
    'Harder to improve in Light runes.</p>';

	if (prace == 'RACE_DIVINE1')
	s+='<h4>Enlightened Maia</h4><p> '+
    'Enjoy superior abilities and good infra-vision.<br/>'+
	'Choose your path of enlightenment, or corruption.<br/>'+
    'Kill a candlebearer or a darkling before level 20 (but not both).'+
    'ESP good creatures and demons. Be able to train in the Astral school.<br/>'+
    'Get the best shop prices but gain experience extremely slowly. Rarely feel the need to feed, and never '+
	'after initiation. Get boosted skills on initiation. Get a bonus on Sneakiness and Stealth.</p>' +
    '<p>'+
    '    See the invisible. Resist light but be susceptible to evil-based attacks.<br/>'+
    '    Get a light aura added to light sources.<br/>'+
    '    Benefit from +1 AC for every 2 levels above 20.<br/>'+
    '    At level 50 be able to levitate, resist poison, electricity and cold and<br/>'+
    '	 be enveloped in an aura of frost and lightning - <br/>'+
    '    plus melee attacks will slay evil opponents intrinsically.</p>';
	
	
	if (prace == 'RACE_DIVINE2') 
	s+='<h4>Corrupted Maia</h4><p> '+
    'Enjoy superior abilities and good infra-vision.<br/>'+
	'Choose your path of enlightenment, or corruption.<br/>'+
    'Kill a candlebearer or a darkling before level 20 (but not both).'+
    'ESP good creatures and demons. Be able to train in the Astral school.<br/>'+
    'Get the best shop prices but gain experience extremely slowly. Rarely feel the need to feed, and never '+
	'after initiation. Get boosted skills on initiation. Get a bonus on Sneakiness and Stealth.</p>' + 
    '<p>>'+
    '    Resist fire and darkness but be susceptible to good-based attacks.<br/>'+
    '    Enjoy +2 bonus HP for each level above 20.<br/>'+
    '    At level 50: become resistant to poison, immune to fire, and<br/>'+
    '    enveloped in a fiery aura.</p>';
	
    //s+='<p>('+prace+')<br/>';
    s+='<p>Stat changes from this race:<br/>';

    if (prace=='RACE_HUMAN')
	{
	    s+='STR:0 INT:0 WIS:0 DEX:0 CON:0 CHR:0 HP:10 EXP%: 100% Infra=0ft</p>';
	}
    if (prace=='RACE_HALF_ELF')
	{
	    s+='STR:-1 INT:+1 WIS:0 DEX:+1 CON:+1 CHR:+1 HP:10 EXP%: 110% Infra=20ft</p>';
	}
    if (prace=='RACE_ELF')
	{
	    s+='STR:-1 INT:+2 WIS:+1 DEX:+1 CON:-2 CHR:+2 HP:9 EXP%: 120% Infra=30ft</p>';
	}
    if (prace=='RACE_HOBBIT')
	{
	    s+='STR:-2 INT:+2 WIS:+1 DEX:+3 CON:0 CHR:+1 HP:8 EXP%: 115% Infra=30ft</p>';
	}
    if (prace=='RACE_GNOME')
	{
	    s+='STR:-1 INT:+2 WIS:0 DEX:+2 CON:+1 CHR:-2 HP:9 EXP%: 125% Infra=40ft</p>';
	}
    if (prace=='RACE_DWARF')
	{
	    s+='STR:+2 INT:-2 WIS:+2 DEX:-2 CON:+2 CHR:-3 HP:11 EXP%: 130% Infra=50ft</p>';
	}
    if (prace=='RACE_HALF_ORC')
	{
	    s+='STR:+2 INT:-1 WIS:0 DEX:0 CON:+1 CHR:-4 HP:11 EXP%: 130% Infra=30ft</p>';
    }
		if (prace=='RACE_HALF_TROLL')
	{
	    s+='STR:+4 INT:-4 WIS:-2 DEX:-4 CON:+3 CHR:-6 HP:12 EXP%: 135% Infra=30ft</p>';
    }
	if (prace=='RACE_DUNADAN')
	{
	    s+='STR:+1 INT:+2 WIS:+2 DEX:+2 CON:+3 CHR:+2 HP:10 EXP%: 170% Infra=0ft</p>';
	}
    if (prace=='RACE_HIGH_ELF')
	{
	    s+='STR:+1 INT:+3 WIS:-1 DEX:+3 CON:+1 CHR:+3 HP:10 EXP%: 250% Infra=40ft</p>';
	}
    if (prace=='RACE_YEEK')
	{
	    s+='STR:-5 INT:-5 WIS:-5 DEX:-5 CON:-5 CHR:-3 HP:8 EXP%: 80% Infra=0ft</p>';
	}
    if (prace=='RACE_GOBLIN')
	{
	    s+='STR:0 INT:-1 WIS:-4 DEX:+4 CON:+2 CHR:-5 HP:10 EXP%: 120% Infra=30ft</p>';
	}
    if (prace=='RACE_ENT')
	{
	    s+='STR:+8 INT:-4 WIS:+2 DEX:-4 CON:+8 CHR:-4 HP:14 EXP%: 320% Infra=0ft</p>';
	}
    if (prace=='RACE_DRIDER')
	{
	    s+='STR:+4 INT:+2 WIS:+2 DEX:+1 CON:+3 CHR:+2 HP:12 EXP%: 350% Infra=50ft</p>';
	}
    if (prace=='RACE_KOBOLD')
	{
	    s+='STR:-1 INT:-1 WIS:0 DEX:+2 CON:+2 CHR:-2 HP:8 EXP%: 115% Infra=50ft</p>';
	}
    if (prace=='RACE_DARK_ELF')
	{
	    s+='STR:0 INT:+2 WIS:+1 DEX:+3 CON:+1 CHR:-6 HP:10 EXP%: 150% Infra=80ft</p>';
	}
    if (prace=='RACE_VAMPIRE')
	{
	    s+='STR:+2 INT:+2 WIS:-1 DEX:+2 CON:0 CHR:+3 HP:11 EXP%: 220% Infra=150ft</p>';
	}
    if (prace=='RACE_DIVINE1' || prace=='RACE_DIVINE2')
	{
	    s+='STR:+2 INT:+3 WIS:+3 DEX:+1 CON:+1 CHR:+2 HP:11 EXP%: 400% Infra=100ft</p>';
	}
    return s;
}

function get_class_advert(pclass)
{
    var s='';
	    if (pclass=='CLASS_WARRIOR')
    {
        s+='<h4>Warrior</h4><p> '+
		    'Enjoy hack-and-slash. Fall back on magical devices. Maximize strength and constitution.<br/>'+
			'Benefit from good dexterity. Do well at melee <br/>'+
			'and bows. You can forget most other skills. Dont learn any magic. Still be able to<br/>'+
			'train in magic devices. Dual-wield with light armour. Go two handed for heavy armour.<br/>'+
			'Get more melee attacks per round. Have the option to be an unbeliever and train anti-magic,<br/>'+
			'forgoing wands, staffs, rods.<br/>'+
            'Just use potions and read scrolls. Perhaps become monk-like by training<br/>'+
			'Martial Arts with no armour or very light armour.<br/>'+
			'Relish a class that is easy, even for beginners. Optimise with high strength, light weapons '+
            'and more blows per round.<br/>'+
			'Make your macro for Sprint and Taunt!<\p>';
    }

    if (pclass=='CLASS_MAGE')
    {
       s+='<h4>Istar</h4><p> '+
			'Be intelligent, get high mana and low spell failure rate. Be the best of magicians.<br/>'+
            'Get good spells.<br/>'+
			'Stuff fighting. Use a Mage Staff. Power up a disruption shield spell once you earn it.<br/>'+
			'Be powerful at high level. Take on the challenge of getting there. Survive with few hit points.<br/>'+
            'Show off your mastery to beginners.<\p>';
    }

    if (pclass=='CLASS_PRIEST')
    {
        s+='<h4>Priest</h4><p> '+
		'Use prayer. Make proper use of blunt and blessed weapons.<br/>'+
		'Learn many spells. Be wise and get mana and spell<br/>'+
		'success. Show off with magical devices. Saving throws that get you out of trouble.<br/>'+ 
		'Weak in the beginning but decent fighters later on. Strong<br/>'+
		'preference for blunt weapons over edged ones. Forget training in edged<br/>'+
		'weapons. Enjoy a big reward for using blessed weapons.<br/>'+
		'Sense curses on items and watch that ability grow '+
		'with each level. Bonus on Holy Curing. Show your maturity as a player by playing a challenging class.<br/>'+
		'Do some decent damage with holy light!<br/>'+
		'Put Cure Wounds on a macro to support your party!<\p>';
    }
	
    if (pclass=='CLASS_ROGUE')
    {
        s+='<h4>Rogue</h4><p> '+
		'Live by cunning but fight your way out of a tight spot. Master traps and locks.<br/>'+
		'Be intelligent and dexterous. Become proficient at magic. Use dexterity<br/>'+
		'in combat. Exploit very high stealth. Sneak up. Get first blow. Backstab. Dual-wield two light<br/>'+
		'one-handed weapons. Light armour. High perception. Notice traps or secret doors. Avoid <br/>'+
		'and disarm traps. Stealing from shops! Be better than warriors or paladins with magical devices.<br/>'+
		'Learn a few magic spells.<br/>'+
		'Spot hidden things at a distance and improve at it with level.<br/>'+
		'At level 15, learn cloaking mode, being very hard to track.<br/>'+
        'Create a macro for Sprint and Taunt when you learn them!<br/>'+
		'Max out sword mastery or martial arts.<\p>';
    }
	
    if (pclass=='CLASS_MIMIC')
    {
        s+='<h4>Mimic</h4><p> '+
		'Learn to appear in different forms! Appear good and wise or dark and sinister.<br/>'+
		'Skin change into animals or perhaps eventually, even master the terrible forms preferred '+
		'by Morgoths Balrogs. Slay your enemies to learn how to mimic their bodies.<br/>'+
		'Inherit the abilities and spells of the form. Utilise strength and constituion.<br/>'+
		'Handy dexterity. Use intelligence to increase mana and success rate of monster powers.<br/>'+
		'Get mimicry skill to 1/2 of any non-unqiue monster level and kill enough to transform yourself.<br/>'+
        'Play as a martial artist to have more usable forms or look for creatures with all slots.<br/>'+
		'Get massive hit points by gaining the right forms such as dragons.<br/>'+
        'Maximize weapon or martials arts skills.<br/>'+
		'Look out for polymorph rings. Make them for other mimics and shaman. Ask others to <br/>'+
		'make them for you!<\p>';
    }
	
    if (pclass=='CLASS_ARCHER')
    {
        s+='<h4>Archer</h4><p>'+
		'Suck at fighting and dont care! Do high damage <br/>'+
		'with ranged weapons. Live on the edge knowing you will die quickly in the wrong situation.<br/>'+
		'Be the best class with any bow, crossbow or sling.<br/>'+
        'Utilise dexterity.<br/>'+
		'OK, bad at melee. Special techniques from <br/>'+
		'your archery skill. Sniping shot. Create ammunition from rubble or from bones.<br/>'+
        'Write a macro for firing your bow. Start with magic ammo. Enchant your ranged weapon.<br/>'+
        'Maximize Bow, Crossbow or Sling.<\p>';
    }
	
    if (pclass=='CLASS_PALADIN')
    {
        s+='<h4>Paladin</h4><p>'+
		'Play a combination of warrior and priest. Melee weapons and divine support.<br/>'+
		'Strength and wisdom. Constitution and dexterity help.<br/>'+
		'Be good with shields if not so good at missile weapons. Never mind<br/>'+
		'stealth, perception, and searching. Better than plain warriors with<br/>'+
		'magical devices. Enjoy an outstanding saving throw.<br/>'+
		'Do Holy Curing, if not as well as priests.<br/>'+
		'Do some decent damage with Holy Light!<br/>'+
		'Write macros to support and heal your party!<br/>'+
        'Max a weapon or martials arts skill.<br/>'+
        'Create a macro for Sprint and Taunt when you learn them!<\p>';
    }
	
    if (pclass=='CLASS_RANGER')
    {
        s+='<h4>Ranger</h4><p>'+
		'Excel at a lot of skills. Fight well. Dual-wield OK <br/>'+
		'with light armour and do magic or archery.<br/>'+
		'Be devoted to nature but avoid corrupted magic and necromancy.<br/>'+
		'Be adept at most types of magic. Skilled trapper. Fight at range.<br/>'+
		'Train your Archery skill up to 10 to increase damage and unlock<br/>'+
		'techniques.<br/>'+
		'Good stealth, perception, searching, saving throws. Good with magical devices.<br/>'+
        'Intelligence for spellcasting. Strength for fighting. Dexterity for ranged weapons.<br/>'+
		'At level 15 pass thick woods. At 25 be an able swimmer.<br/>'+
		'Make a macro for ranged attacks. Use light armour and dual-wield.<br/>'+
        'Create a macro for Sprint and Taunt when you learn them!<\p>';
    }
	
    if (pclass=='CLASS_ADVENTURER')
    {
        s+='<h4>Adventurer</h4><p>'+
		'Need to know exactly what you are trying to achieve and<br/>'+
		'how you want to distribute skill points to be effective.<br/>'+
		'Hardy and versatile. Start with no big strengths nor weaknesses.<br/>'+
		'Be able to train nearly all skills and unfold a careful plan for your character.<br/>'+
		'Increase your mana with both intelligence and wisdom.<br/>'+
		'Create an unusual mixture of abilities.<\p>';
    }
	
    if (pclass=='CLASS_DRUID')
    {
        s+='<h4>Druid</h4><p>'+
		'Make use of Druidic magic schools. Wisdom for mana and success chances.'+
		'Use intelligence for other magic schools.<br/>'+
        'Fight using Martial Arts and abandon weapons. Cast magic spells. Weaponless combat.<br/>'+
		'No ranged weapons. Light armour, if any.<br/>'+
        'Shape change into several forms without the need to kill those creatures to do it.<br/>'+
        'Learn new forms every five character levels.<br/>'+
		'Be able to use full equipment, even while transformed.<br/>'+
		'Pass through thick forest at level 10, even when not in animal form.<br/>'+
		'Cast Toxic Moisture for powerful damage. Look for it in the book store right away!<br/>'+
        'Create a macro for Sprint and Taunt when you learn them!<\p>';
    }
	
    if (pclass=='CLASS_SHAMAN')
    {
        s+='<h4>Shaman</h4><p>'+
		'Use both spiritual and magical powers. Gain mana from intelligence or wisdom.<br/>'+
		'Shapeshift into animals, trolls, giants,<br/>'+
		'dragons and dragonriders, angels, hybrid creatures, golems, spirits,<br/>'+
		'elementals and ghosts.<br/>'+
		'Use the full equipment slots for spirits, elementals and ghosts.<br/>'+
		'Move straight even in confusing forms.<br/>'+
        'Learn elemental (E) and semi-elemental (X) forms especially<br/>'+
		'quickly.<br/>'+
        'Tollerate weaker combat abilities than rangers or paladins but train melee anyway.<br/>'+
		'See invisible at level 20.<br/>'+
		'Look out for polymorph rings. Make them for other mimics and shaman. Ask others to <br/>'+
		'make them for you.<\p>';
    }
	
    if (pclass=='CLASS_RUNEMASTER')
    {
        s+='<h4>Runemaster</h4><p>'+
		'Use arcane symbols and runes to summon pure elemental magic.<br/>'+
		'Use intelligence and dexterity. Perhaps do a bit of thievery.<br/>'+
        'Use some skills that are typical for rogues. OK for weapons.<br/>'+
		'Cannot train in the martial arts. Adept with boomerangs. Utilise<br/>'+
		'runes to wreak havoc and kill everything in sight!<br/>'+
        'Enhance equipment at high level (1 weapon, 1 armor) using runic sigils.<br/>'+
        'Cast runespells with runes in your inventory to help with backlash.<br/>'+
        'Use sigil type runespells with your runes.<br/>'+
		'Manage the runespell backlash on failure. Use basic elemental<br/>'+
		'spells in the beginning with the required<br/>'+
		'resistance. Make use of the Arena Monster Challenge to test rune combinations!<\p>';
    }
	
    if (pclass=='CLASS_MINDCRAFTER')
    {
        s+='<h4>Mindcrafter</h4><p> '+
		'Be a great melee fighter. Additionally, train telepathy and psychic powers.<br/>'+
		'Use your intelligence needed for spells. A calm, silent fighter, with a repertoire that is more'+
        'effective against creatures of intelligence. Strength for engaging in close combat.<br/>'+
		'Maximize psychic energy by avoiding heavy head gear.<br/>'+
		'Resist sanity-draining effects at level 10 and even better at level 20.<br/>'+
		'Cast while blinded or even confused. (Some targetted spells need no line of<br/>'+
		'sight). Master spells that cannot be reflected by monsters.<br/>'+
		'Get party members to open their mind to telepathy using the p key.<br/>'+
        'Necromancy skills are distracting and training them requires more effort.<br/>'+
        'Get telepathy and pyschic resistance. Psionic Blast early on, a powerful ranged attack spell.<br/>'+
        'Max weapon or martials arts skills.<\p>';
	}

    s += '<p>Stat changes from this class:<br/>';

    if (pclass=='CLASS_WARRIOR')
	{
			s+='STR:+5 INT:-2 WIS:-2 DEX:+2 CON:+2 CHR:-1 HP:10 EXP%: +0%</p>';
	}
    if (pclass=='CLASS_MAGE')
    {
   			s+='STR:-5 INT:+3 WIS:-0 DEX:+1 CON:-2 CHR:+1 HP:+0 EXP%: +35%</p>';
    }
    if (pclass=='CLASS_PRIEST')
    {
   			s+='STR:-1 INT:-3 WIS:+3 DEX:-1 CON:0 CHR:+2 HP:+0 EXP%: +20%</p>';
    }
    if (pclass=='CLASS_ROGUE')
    {
   			s+='STR:+2 INT:+1 WIS:-2 DEX:+3 CON:+1 CHR:-1 HP:+5 EXP%: +15%</p>';
    }
    if (pclass=='CLASS_PRIEST')
    {
   			s+='STR:+1 INT:0 WIS:0 DEX:+1 CON:+1 CHR:-4 HP:+6 EXP%: +30%</p>';
    }
    if (pclass=='CLASS_MIMIC')
    {
   			s+='STR:+1 INT:0 WIS:+2 DEX:+3 CON:+1 CHR:-1 HP:+5 EXP%: +10%</p>';
    }
    if (pclass=='CLASS_PALADIN')
    {
   			s+='STR:+3 INT:-3 WIS:+1 DEX:0 CON:+2 CHR:+2 HP:+8 EXP%: +30%</p>';
    }
    if (pclass=='CLASS_RANGER')
    {
   			s+='STR:+2 INT:+2 WIS:-1 DEX:+1 CON:+2 CHR:0 HP:+7 EXP%: +35%</p>';
    }
    if (pclass=='CLASS_ARCHER')
    {
   			s+='STR:+1 INT:0 WIS:+2 DEX:+3 CON:+1 CHR:-1 HP:+5 EXP%: +10%</p>';
    }
    if (pclass=='CLASS_ADVENTURER')
    {
   			s+='STR:0 INT:0 WIS:0 DEX:0 CON:0 CHR:0 HP:+6 EXP%: +25%</p>';
    }
    if (pclass=='CLASS_DRUID')
    {
   			s+='STR:+1 INT:0 WIS:+2 DEX:-2 CON:-2 CHR:+1 HP:+5 EXP%: +35%</p>';
    }
    if (pclass=='CLASS_SHAMAN')
    {
   			s+='STR:0 INT:+1 WIS:+2 DEX:-2 CON:0 CHR:0 HP:+3 EXP%: +40%</p>';
    }
    if (pclass=='CLASS_RUNEMASTER')
    {
   			s+='STR:+1 INT:+2 WIS:-3 DEX:+3 CON:-3 CHR:-3 HP:+5 EXP%: +20%</p>';
    }
    if (pclass=='CLASS_MINDCRAFTER')
    {
   			s+='STR:+2 INT:+2 WIS:0 DEX:0 CON:0 CHR:+1 HP:+5 EXP%: +25%</p>';
    }
   
    return s;
}

function get_spell_level(sspell) {
	var school=SPELL[sspell][1];
	if (school != 'Mana' &&
	    school != 'Fire' &&
	    school != 'Water' &&
	    school != 'Air' &&
	    school != 'Earth' &&
	    school != 'Nature' &&
	    school != 'Conveyance' &&
	    school != 'Divination' &&
	    school != 'Temporal' &&
	    school != 'Udun' &&
	    school != 'Mind' &&
	    school != 'Meta') return v(school.toUpperCase());
	
	return Math.max(v(school.toUpperCase()), v('SORCERY')); 
}
function spell_power(sspell) {
	var school=SPELL[sspell][1];
	if (school != 'HOffense' &&
	    school != 'HDefense' &&
	    school != 'HSupport' &&
	    school != 'HCuring' &&
	    school != 'Mana' &&
	    school != 'Fire' &&
	    school != 'Water' &&
	    school != 'Air' &&
	    school != 'Earth' &&
	    school != 'Nature' &&
	    school != 'Conveyance' &&
	    school != 'Divination' &&
	    school != 'Temporal' &&
	    school != 'Udun' &&
	    school != 'Mind' &&
	    school != 'Meta') return 1;

	return (1 + v('SPELL')/50000*40/100).toFixed(3);
}

function get_spell_advert(sspell) {
	if (sspell=='TeleKenisis II') return get_telekenesisII_advert(sspell);
	if (sspell=='Holy Light') return get_holyLight_advert(sspell);   
	var school=SPELL[sspell][1];
	var level=Math.floor(get_spell_level(sspell)/1000);
	level=Math.floor(1+level-SPELL[sspell][0]);
	if (level <= 0) return '';
	return sspell+' ('+ Math.floor(level * spell_power(sspell)) +') <br/>';
}

function get_telekenesisII_advert(sspell) {
	var level1=Math.floor(v('MINTRUSION')/1000);
	var level2=Math.floor(v('PPOWER')/1000);
	var level=Math.floor((level1+level2)/2)-1;
	if (level<=0) return '';
	return sspell+' ('+(level)+')  <br/>';
}

function get_holyLight_advert(sspell) {
	var level1=Math.floor(v('HSUPPORT')/1000);
	var level2=Math.floor(v('HOFFENSE')/1000);
	var level=Math.floor((level1+level2)/2)-1;
	if (level<=0) return '';
	return sspell+' ('+Math.floor(level * spell_power(sspell))+')  <br/>';
}
var required_level = 0;
function get_form_advert(sform, appropriate) {
	var mimicry_level=Math.floor(v('MIMIC')/1000);
	var form_level=BODYFORM[sform][0];
	var form_desc=BODYFORM[sform][1];
	if (form_desc!=appropriate) return '';
	if (form_desc=='Druid')
	{
	    if (form_level>required_level) return '';
	}
	else
	{
	    if (form_level>mimicry_level*2) return '';
    }
	var kills=0;
	if (form_desc=='Shaman')
    {
        kills=Math.floor(form_level/3);
		if (kills!=form_level/3)
		{
		    kills++;
		}
    }		
	kills=form_level;
	return sform+" ("+kills+')<br/>';
}
EOM
