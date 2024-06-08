PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
DROP TABLE IF EXISTS 'domainlist_by_group';
DROP TABLE IF EXISTS 'group';
DROP TABLE IF EXISTS 'domainlist';
DROP TABLE IF EXISTS 'adlist';
CREATE TABLE IF NOT EXISTS "group"
(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	enabled BOOLEAN NOT NULL DEFAULT 1,
	name TEXT UNIQUE NOT NULL,
	date_added INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
	date_modified INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
	description TEXT
);
INSERT INTO "group" VALUES(0,1,'Default',1717545047,1717545047,NULL);
INSERT INTO "group" VALUES(2,1,'Apple_TVs',1614545880,1717545047,NULL);
INSERT INTO "group" VALUES(3,1,'Kaylee_Away',1634782874,1717545047,NULL);
INSERT INTO "group" VALUES(4,1,'Amazon_Devices',1652025891,1717545047,NULL);
INSERT INTO "group" VALUES(5,1,'Excluded_Hosts',1656172907,1717545047,NULL);
CREATE TABLE domainlist
(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	type INTEGER NOT NULL DEFAULT 0,
	domain TEXT NOT NULL,
	enabled BOOLEAN NOT NULL DEFAULT 1,
	date_added INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
	date_modified INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
	comment TEXT,
	UNIQUE(domain, type)
);
INSERT INTO domainlist VALUES(1,0,'int.royaleglen.net',1,1606530876,1717545047,'RGnet Internal Domain');
INSERT INTO domainlist VALUES(2,3,'^(.+[_.-])?adse?rv(er?|ice)?s?[0-9]*[_.-]',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(3,3,'^(.+[_.-])?telemetry[_.-]',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(4,3,'^ad([sxv]?[0-9]*|system)[_.-]([^.[:space:]]+\.){1,}|[_.-]ad([sxv]?[0-9]*|system)[_.-]',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(5,3,'^adim(age|g)s?[0-9]*[_.-]',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(6,3,'^adtrack(er|ing)?[0-9]*[_.-]',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(7,3,'^advert(s|is(ing|ements?))?[0-9]*[_.-]',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(8,3,'^aff(iliat(es?|ion))?[_.-]',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(9,3,'^analytics?[_.-]',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(10,3,'^banners?[_.-]',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(11,3,'^beacons?[0-9]*[_.-]',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(12,3,'^count(ers?)?[0-9]*[_.-]',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(13,3,'^mads\.',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(14,3,'^pixels?[-.]',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(15,3,'^stat(s|istics)?[0-9]*[_.-]',1,1607133148,1717545046,'github.com/mmotti/pihole-regex');
INSERT INTO domainlist VALUES(16,3,'(.*)\.g00\.(.*)',1,1607133362,1717545046,NULL);
INSERT INTO domainlist VALUES(17,0,'secure-dcr.imrworldwide.com',1,1607227428,1717545047,'Added from Query Log');
INSERT INTO domainlist VALUES(35,1,'d2yyd1h5u9mauk.cloudfront.net',1,1608776252,1717545046,'Unifi Survey');
INSERT INTO domainlist VALUES(50,0,'telemetry.api.2kcoretech.online',1,1609898884,1717545047,'PGA 2K21');
INSERT INTO domainlist VALUES(65,0,'www.houzz.com',1,1610762913,1717545047,'Added from Query Log');
INSERT INTO domainlist VALUES(86,1,'iadcontent.apple.com',1,1631068488,1717545046,NULL);
INSERT INTO domainlist VALUES(101,1,'www.easy4ip.com',1,1637293459,1717545046,'Added from Query Log');
INSERT INTO domainlist VALUES(116,2,'(\.|^)cws\.conviva\.com$',0,1659405845,1717545047,NULL);
INSERT INTO domainlist VALUES(131,0,'wallet-api.urbanairship.com',1,1687974145,1717545047,'Added from Query Log');
INSERT INTO domainlist VALUES(148,2,'ads-[*]-darwin.hulustream.com',1,1693878752,1717545047,NULL);
INSERT INTO domainlist VALUES(149,2,'(\.|^)hulustream\.com$',1,1693880556,1717545047,NULL);
INSERT INTO domainlist VALUES(164,0,'assets.huluim.com',1,1710811446,1717545047,'Added from Query Log');
CREATE TABLE adlist
(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	address TEXT UNIQUE NOT NULL,
	enabled BOOLEAN NOT NULL DEFAULT 1,
	date_added INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
	date_modified INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
	comment TEXT,
	date_updated INTEGER,
	number INTEGER NOT NULL DEFAULT 0,
	invalid_domains INTEGER NOT NULL DEFAULT 0,
	status INTEGER NOT NULL DEFAULT 0
);
INSERT INTO adlist VALUES(1,'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',1,1606530681,1717545045,'Migrated from /etc/pihole/adlists.list',1717554488,144895,1,2);
INSERT INTO adlist VALUES(10,'https://raw.githubusercontent.com/Sekhan/TheGreatWall/master/TheGreatWall.txt',1,1613334855,1717545045,'Great Wall DoH Bootstrap',1717554489,132,1,2);
INSERT INTO adlist VALUES(14,'https://raw.githubusercontent.com/lightswitch05/hosts/master/docs/lists/ads-and-tracking-extended.txt',1,1676817471,1717545045,'Developer Dan - Ads &amp; Tracking',1717554489,429286,0,2);
INSERT INTO adlist VALUES(15,'https://raw.githubusercontent.com/lightswitch05/hosts/master/docs/lists/hate-and-junk-extended.txt',1,1676817540,1717545045,'Developer Dan - Hate &amp; Junk',1717554490,2232,0,2);
INSERT INTO adlist VALUES(16,'https://raw.githubusercontent.com/lightswitch05/hosts/master/docs/lists/facebook-extended.txt',1,1676817575,1717545045,'Developer Dan - Facebook*',1717554490,29731,0,2);
INSERT INTO adlist VALUES(17,'https://raw.githubusercontent.com/blocklistproject/Lists/master/fraud.txt',1,1676817792,1717545045,'The Block List Project - Fraud',1717554490,196082,0,2);
INSERT INTO adlist VALUES(18,'https://raw.githubusercontent.com/blocklistproject/Lists/master/porn.txt',1,1676817826,1717545045,'The Block List Project - Porn',1717554492,500280,0,2);
INSERT INTO adlist VALUES(19,'https://raw.githubusercontent.com/blocklistproject/Lists/master/piracy.txt',1,1676817859,1717545045,'The Block List Project - Piracy',1717554492,2153,0,2);
INSERT INTO adlist VALUES(20,'https://raw.githubusercontent.com/blocklistproject/Lists/master/phishing.txt',1,1676817932,1717545045,'The Block List Project - Phishing',1717554492,190224,0,2);
INSERT INTO adlist VALUES(21,'https://raw.githubusercontent.com/blocklistproject/Lists/master/malware.txt',1,1676817962,1717545045,'The Block List Project - Malware',1717554494,435262,2,2);
INSERT INTO adlist VALUES(22,'https://raw.githubusercontent.com/blocklistproject/Lists/master/tracking.txt',1,1676818025,1717545046,'The Block List Project - Tracking',1717554495,15070,0,2);
INSERT INTO adlist VALUES(23,'https://raw.githubusercontent.com/lightswitch05/hosts/master/docs/lists/dating-services-extended.txt',1,1693837525,1717545046,'Develop Dan - Dating Sites',1717554495,21671,1,2);
INSERT INTO adlist VALUES(25,'https://raw.githubusercontent.com/wranders/doh-list/master/doh-list.txt',1,1704651982,1717545046,'DNS over HTTPS Block',1717554495,566,0,2);
CREATE TABLE domainlist_by_group
(
	domainlist_id INTEGER NOT NULL REFERENCES domainlist (id),
	group_id INTEGER NOT NULL REFERENCES "group" (id),
	PRIMARY KEY (domainlist_id, group_id)
);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(1,17,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(2,50,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(3,65,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(4,1,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(5,1,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(6,1,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(7,1,4);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(8,2,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(9,2,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(10,2,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(11,3,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(12,3,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(13,3,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(14,4,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(15,4,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(16,4,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(17,5,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(18,5,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(19,5,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(20,6,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(21,6,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(22,6,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(23,7,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(24,7,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(25,7,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(26,8,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(27,8,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(28,8,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(29,9,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(30,9,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(31,9,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(32,10,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(33,10,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(34,10,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(35,11,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(36,11,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(37,11,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(38,12,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(39,12,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(40,12,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(41,13,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(42,13,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(43,13,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(44,14,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(45,14,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(46,14,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(47,15,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(48,15,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(49,15,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(50,35,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(51,35,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(52,35,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(53,35,4);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(54,35,5);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(55,86,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(56,86,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(57,86,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(58,101,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(59,101,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(60,101,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(61,131,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(62,131,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(63,116,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(64,116,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(65,16,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(66,16,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(67,16,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(68,16,4);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(69,148,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(70,148,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(71,148,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(72,149,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(73,149,2);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(74,149,3);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(75,164,0);
COMMIT;
