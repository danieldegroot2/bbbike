# temp-blocking
# undef old entries
require Time::Local;
@temp_blocking =
    (
     { from  => Time::Local::timelocal(reverse(2003-1900,5-1,21,0,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,5-1,23,0,0,0)),
       file  => "richardplatz.bbd",
       text  => "Richardplatz - wegen eines Stra�enfestes f�r den gesamten Fahrzeugverkehr gesperrt",
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,5-1,26,0,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,6-1,2,0,0,0)),
       file  => "kirchentag-20030526.bbd",
       text  => "Gesperrte Stra�en w�hren des Kirchentages vom 26.5. bis zum 1.6. (Stra�e des 17. Juni)",
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,5-1,27,8,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,5-1,29,0,0,0)),
       file  => "kirchentag-20030528.bbd",
       text  => "Gesperrte Stra�en am 28.5. zwischen 14 Und 24 Uhr w�hrend des Kirchentages (im Bereich Pariser Platz - Unter den Linden - Friedrichstr. - Gendarmenmarkt)",
       type  => "handicap",
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,6-1,6,0,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,6-1,9,23,59,0)),
       file  => "strassenfest-bluecherplatz.bbd",
       text  => "Stra�enfest rund um den Bl�cherplatz vom 6.6. - 9.6.",
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,6-1,7,0,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,6-1,8,22,0,0)),
       file  => "karneval-der-kulturen.bbd",
       text  => "Karneval der Kulturen am 8.6. (Hasenheide - Gneisenaustr. - Yorckstr.)",
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,6-1,19,6,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,6-1,22,22,0,0)),
       file  => "richardplatz.bbd",
       text  => "Richardplatz - wegen eines Stra�enfestes f�r den gesamten Fahrzeugverkehr gesperrt. Dauer: 21.06.03, 06:00 Uhr bis 22.06.03, 22:00 Uhr",
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,6-1,26,10,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,6-1,29,18,0,0)),
       file  => "wiesenfest.bbd",
       text  => "Finsterwalder Stra�e zwischen Engelroder Weg und Calauer Stra�e Vollsperrung aufgrund des Wiesenfestes. Dauer:28.06.2003, 10.00 Uhr bis 29.06.2003, 18.00 Uhr",
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,6-1,20,4,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,6-1,22,23,59,59)),
       file  => "strassenfest-karl-marx-str.bbd",
       text  => "Karl-Marx-Stra�e zwischen Flughafenstra�e und Werbellinstra�e, Erkstra�e zwischen Karl-Marx-Stra�e und Donaustra�e: Stra�enfest, Stra�en gesperrt. Datum: 21.06.2003, 04.00 Uhr bis 22.06.2003, 24.00 Uhr",
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,6-1,23,5,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,6-1,29,5,0,0)),
       file  => "csd.bbd",
       text  => "CSD am 28.5.",
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,6-1,27,6,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,6-1,29,23,59,59)),
       file  => "badstr.bbd",
       text  => "Badstra�e zwischen B�ttgerstra�e und Pankstra�e: in beiden Richtungen Veranstaltung, Stra�e gesperrt",
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,7-1,3,6,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,7-1,7,23,59,59)),
       file  => "rheinstrassenfest.bbd",
       text  => "Rheinstra�enfest in der Rheinstra�e zwischen Breslauer Platz  und Walter-Schreiber-Platz. Beide Richtungsfahrbahnen sind ab dem 05.07.2003, 06.00 Uhr bis zum 06.07.2003, 24.00 Uhr gesperrt.",
     },
     # XXX
     { from  => Time::Local::timelocal(reverse(2003-1900,7-1,8,6,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,7-1,12,23,59,59)),
       file  => "loveparade.bbd",
       text  => "Loveparade, Stra�en gesperrt. Dauer: 11.07.2003, 20.00 Uhr bis 13.07.2003, 14.00 Uhr",
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,7-1,7,6,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,7-1,12,20,00,00)),
       file  => "kranarbeiten.bbd",
       text  => "Charlottenstra�e zwischen Kochstra�e und Besselstra�e Kranarbeiten, Stra�e gesperrt. Dauer: 08.07.2003, 06.00 Uhr bis 12.07.2003, 20.00 Uhr",
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,7-1,10,20,0,0)),
       until => Time::Local::timelocal(reverse(2003-1900,7-1,14,4,00,00)),
       file  => "pankow-20030711.bbd",
       text  => "Berliner Stra�e zwischen Granitzstra�e und Hadlichstra�e sowie
Florastra�e zwischen Grunowstra�e und Berliner Stra�e, Baustelle, Stra�e in beiden Richtungen gesperrt. Dauer: 11.07.2003, 20.00 Uhr bis 14.07.2003, 04.00 Uhr",
       type  => "handicap",
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,7-1,19,8,00,00)),
       until => Time::Local::timelocal(reverse(2003-1900,7-1,20,20,00,00)),
       file  => "stauffenbergstr.bbd",
       text  => "Stauffenbergstr. und Umgebung wegen Veranstaltung gesperrt. Dauer: 20.07.2003, 08.00 Uhr bis 20.00 Uhr"
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,7-1,18,7,00,00)),
       until => Time::Local::timelocal(reverse(2003-1900,7-1,20,23,59,00)),
       file  => "oberbaumbruecke.bbd",
       text  => "Oberbaum-Br�ckenfest am 20.07.2003 zwischen 07.00 Uhr bis 24.00 Uhr f�r den Fahrzeugverkehr gesperrt."
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,8-1,8,7,00,00)),
       until => Time::Local::timelocal(reverse(2003-1900,8-1,10,23,59,00)),
       file  => "oberbaumbruecke.bbd",
       text  => "Oberbaum-Br�ckenfest am 10.08.2003 zwischen 07.00 Uhr bis 24.00 Uhr f�r den Fahrzeugverkehr gesperrt."
     },
     { from  => 1060257600, # 2003-08-07 14:00
       until => 1060466400, # 2003-08-10 00:00
       file  => '20030809.bbd',
       text  => 'Im Bereich Tauentzienstra�e, Kurf�rstendamm zwischen N�rnberger Stra�e und Joachim-Friedrich-Stra�e, Droysenstra�e, Kantstra�e, in beiden Richtungen Sportveranstaltung, Stra�e gesperrt. Dauer: 09.08.2003, 14.00 Uhr bis 24.00 Uhr'
     },
     { from  => 1061640000, # 2003-08-23 14:00
       until => 1061748000, # 2003-08-24 20:00
       file  => 'xrace.bbd',
       text  => 'Stra�e des 17. Juni ist zwischen Entlastungstra�e und Klopstockstra�e gesperrt. (X Race-Veranstaltung) Dauer: 24.08.2003, von 14.00 Uhr bis 20.00 Uhr'
     },
     { from  => 1059190200, # 2003-07-26 05:30
       until => 1059336000, # 2003-07-27 22:00
       file  => '20030727.bbd',
       text  => 'Kurf�rstendamm zwischen Joachimstaler Stra�e und Fasanenstra�e in Fahrtrichtung Westen gesperrt (Kranarbeiten). Dauer: 27.07.2003 zwischen 05.30 Uhr und ca. 22.00 Uhr',
       type  => "handicap",
     },
     { from  => 1061539200, # 2003-08-22 10:00
       until => 1061661600, # 2003-08-23 20:00
       file  => 'johnfosterdulles.bbd',
       text  => 'John-Foster-Dulles-Allee zwischen Spreeweg und Entlastungsstra�e, Sportveranstaltung, Stra�e in beiden Richtungen gesperrt. Dauer: 23.08.2003, 10.00 Uhr bis 20.00 Uhr',
       type  => 'gesperrt',
     },
     { from  => 1062136800, # 2003-08-29 08:00
       until => 1062280800, # 2003-08-31 00:00
       file  => 'maybachufer.bbd',
       text  => 'Maybachufer zwischen Kottbusser Tor und Hobrechtbr�cke wegen Stra�enfest f�r den Fahrzeugverkehr gesperrt. Dauer: 30.08.2003 zwischen 08.00 Uhr und 24.00 Uhr',
       type  => 'gesperrt',
     },
     { from  => Time::Local::timelocal(reverse(2003-1900,8-1,9,10,00,00)),
       until => Time::Local::timelocal(reverse(2003-1900,8-1,10,20,00,00)),
       file  => 'johnfosterdulles.bbd',
       text  => 'John-Foster-Dulles-Allee zwischen Spreeweg und Entlastungsstra�e, Sportveranstaltung, Stra�e in beiden Richtungen gesperrt. Dauer: 10.08.2003, 10.00 Uhr bis 20.00 Uhr',
       type  => 'gesperrt',
     },
     { from  => 1061496000, # 2003-08-21 22:00
       until => 1061676000, # 2003-08-24 00:00
       file  => 'hanfparade.bbd',
       text  => 'Sperrungen zur Hafparade am 23.8.2003',
       type  => 'gesperrt',
     },
     { from  => 1061625600, # 2003-08-23 10:00
       until => 1061730000, # 2003-08-24 15:00
       file  => 'kudamm_rad.bbd',
       text  => 'Kurf�rstendamm (s�dl. Richtungsfahrbahn) zwischen Uhlandstra�e und Leibnizstra�e gesperrt. Grund: Radsportveranstaltung Dauer: 24.08.2003,10.00 Uhr bis 15.00 Uhr',
       type  => 'gesperrt',
     },
     { from  => 1062136800, # 2003-08-29 08:00
       until => 1062280800, # 2003-08-31 00:00
       file  => 'kudamm_rad.bbd',
       text  => 'Kurf�rstendamm (s�dl. Richtungsfahrbahn) zwischen Uhlandstra�e und Leibnizstra�e gesperrt. Grund: Radsportveranstaltung Dauer: 30.08.2003 zwischen 08.00 Uhr und 24.00 Uhr Uhr ',
       type  => 'gesperrt',
     },
     { from  => 1061503200, # 2003-08-22 00:00
       until => 1061762400, # 2003-08-25 00:00
       file  => 'muellerstr.bbd',
       text  => 'Stra�enfest in der M�llerstra�e bis 24.8.2003',
       type  => 'gesperrt',
     },
     { from  => 1061517600, # 2003-08-22 04:00
       until => 1061762400, # 2003-08-25 00:00
       file  => 'reichsstr.bbd',
       text  => 'Wegen eines Festes kann die Reichsstra�e am Sonnabend ab 4 Uhr bis Sonntag (24 Uhr) vom Steubenplatz bis zum Theodor-Heuss-Platz nicht passiert werden',
       type  => 'gesperrt',
     },
     { from  => 1062829800, # 2003-09-06 08:30
       until => 1062943200, # 2003-09-07 16:00
       file  => '20030907.bbd',
       text  => 'Rixdorfer Stra�e, Alt-Mariendorf, Mariendorfer Damm, Ullsteinstra�e wegen Rundkurs Sportveranstaltung gesperrt. Dauer: 07.09.2003 zwischen 08.30 Uhr und 16.00 Uhr',
       type  => 'gesperrt',
     },
     { from  => 1062540000, # 2003-09-03 00:00
       until => 1062972000, # 2003-09-08 00:00
       file  => 'globalcity.bbd',
       text  => 'Global City (05.09.03 - 07.09.03): Kurf�rstendamm/Tauentzienstr. von Uhlandstr. bis Passauer Str. gesperrt',
       type  => 'gesperrt',
     },
     { from  => 1062813600, # 2003-09-06 04:00
       until => 1064181600, # 2003-09-22 00:00
       file  => '20030907b.bbd',
       text  => 'F�rstenwalder Damm zwischen B�lschestra�e und Hartlebenstra�e Baustell stadtausw�rts, Stra�e gesperrt, eine Umleitung ist eingerichtet, Dauer: 07.09.2003,04.00 Uhr bis 21.09.2003',
       type  => 'gesperrt',
     },
     { from  => 1063339200, # 2003-09-12 06:00
       until => 1063576800, # 2003-09-15 00:00
       file  => 'winzerfest.bbd',
       text  => 'Bahnhofstra�e, zwischen Goltzstra�e und Steinstra�e Vollsperrung, vom 13.09.2003, 06.00 Uhr bis 14.09.2003, 24.00 Uhr ',
       type  => 'gesperrt',
     },
     { from  => 1065060000, # 2003-10-02 04:00
       until => 1065391200, # 2003-10-06 00:00
       file  => 'karlmarx.bbd',
       text  => 'Karl-Marx-Stra�e, zwischen Flughafenstra�e und Uthmannstra�e gesperrt. Grund: Stra�enfest. Dauer: 03.10.2003, 04.00 Uhr bis 05.10.2003, 24.00 Uhr ',
       type  => 'handicap',
     },
     { from  => 1065758400, # 2003-10-10 06:00
       until => 1065996000, # 2003-10-13 00:00
       file  => 'hermannstr.bbd',
       text  => 'Hermannstra�e, zwischen Emserstra�e und Thomasstra�e gesperrt. Grund: Stra�enfest. Dauer: 11.10.2003, 06.00 Uhr bis 12.10.2003, 24.00 Uhr',
       type  => 'handicap',
     },
     { from  => 1066924800, # 2003-10-23 18:00
       until => 1067295600, # 2003-10-28 00:00
       file  => 'schlichtallee.bbd',
       text  => 'Schlichtallee, zwischen Hauptstra�e und L�ckstra�e, Vollsperrung vom 24.10.03, 18.00 Uhr bis 27.10.03, 04.00 Uhr wegen Ein-/Ausbau der Bahnbr�cken. ',
       type  => 'gesperrt',
     },
     { from  => 1070341200, # 2003-12-02 06:00
       until => 1070924399, # 2003-12-08 23:59
       file  => 'rixdorfer_weihnachtsmarkt.bbd',
       text  => 'Rixdorfer Weihnachtsmarkt',
       type  => 'gesperrt',
     },
     { from  => 1069620183, # 2003-11-23 21:43
       until => 1072212183, # 2003-12-23 21:43
       file  => 'spandauer_weihnachtsmarkt.bbd',
       text  => 'Spandauer Weihnachtsmarkt',
       type  => 'gesperrt',
     },
     { from  => 1070600400, # 2003-12-05 06:00
       until => 1070838000, # 2003-12-08 00:00
       file  => 'sophienstr.bbd',
       text  => 'Sophienstra�e zwischen Rosenthaler Stra�e und Gro�e Hamburger Stra�e wegen 8. Umwelt - und Weihnachtsmarkt f�r den Fahrzeugverkehr gesperrt (keine Wendem�glichkeit f�r Lkw). Dauer : 6.12.2003 / 06.00 Uhr bis 7.12.2003 / 24.00 Uhr ',
       type  => 'gesperrt',
     },
     { from  => 1079046000, # 2004-03-12 00:00
       until => 1079319600, # 2004-03-15 04:00
       file  => 'sbhf_pankow.bbd',
       text  => 'Berliner Stra�e zwischen Florastra�e und Granitzstra�e in beiden Richtungen gesperrt (H�he S-Bhf. Pankow). Grund: Br�ckenarbeiten. Eine Umleitung ist ausgeschildert. Dauer: 13.03.2004, 00:00 Uhr bis 15.03.2004, 04:00 Uhr',
       type  => 'gesperrt',
     },
     { from  => 1079236800, # 2004-03-14 05:00
       until => 1080514800, # 2004-03-29 01:00
       file  => 'langhansstr.bbd',
       text  => 'Die Langhansstra�e ist zwischen Prenzlauer Promenade und Heinersdorfer Stra�e in beiden Richtungen gesperrt. Grund: Bauma�nahmen. Dauer:15.03.2004, 05:00 Uhr bis 28.03.2004, 17:00 Uhr. Eine Umleitung ist ausgeschildert.',
       type  => 'gesperrt',
     },
     { from  => 1079766000, # 2004-03-20 08:00
       until => 1079888400, # 2004-03-21 18:00
       file  => 'residenz_rad.bbd',
       text  => 'Residenzstra�e zwischen Lindauer Allee und Emmentaler Stra�e, Emmentaler Stra�e zwischen Residenzstra�e und Aroser Allee, Aroser Allee zwischen Emmentaler Stra�e und Lindauer Allee sowie Lindauer Allee zwischen Aroser Allee und Residenzstra�e. Stra�en gesperrt. Radrennen. Umleitung ist ausgeschildert. Dauer: 21.03.2004, 08.00 Uhr bis 18.00 Uhr',
       type  => 'gesperrt',
     },
     { from  => 1079701200, # 2004-03-19 14:00
       until => 1080856800, # 2004-04-02 00:00
       file  => 'budapester.bbd',
       text  => 'Budapester Stra�e, St�lerstra�e, zwischen Klingelh�ferstra�e und Kurf�rstenstrs�e in beiden Richtungen f�r den Durchgangsverkehrgesperrt. Konferenz. Dauer: 20.03.2004, 14.00 Uhr bis 01.04.2004, 18.00 Uhr',
       type  => 'gesperrt',
     },
     { from  => 1081476000, # 2004-04-09 04:00
       until => 1081807200, # 2004-04-13 00:00
       file  => 'artists_boulevard.bbd',
       text  => 'Potsdamer Stra�e zwischen Sch�neberger Ufer und Pohlstra�e in beiden Richtungen gesperrt, Veranstaltung (Boulevard des Artistes). Dauer: 10.04.2004, 04:00 Uhr bis 12.04.2004, 24:00 Uhr',
       type  => 'gesperrt',
     },
     { from  => 1082869200, # 2004-04-25 07:00
       until => 1083362400, # 2004-05-01 00:00
       file  => 'lueckstr.bbd',
       text  => 'L�ckstra�e zwischen Giselastra�e und Schlichtallee in Fahrtrichtung Schlichtallee Bauarbeiten, Stra�e gesperrt. Dauer: 26.04.2004, 07:00 Uhr bis voraussichtlich 30.04.2004 ',
       type  => 'handicap',
     },
     { from  => 1083204000, # 2004-04-29 04:00
       until => 1083535200, # 2004-05-03 00:00
       file  => 'turmstr.bbd',
       text  => 'Turmstra�e zwischen Stromstra�e und Oldenburger Stra�e/Ottostra�e Fr�hlingsfest, Stra�e gesperrt, Dauer: 30.04.2004, 04.00 Uhr bis 02.05.2004, 24.00 Uhr',
       type  => 'gesperrt',
     },
     { from  => Time::Local::timelocal(reverse(2004-1900,4-1,30,12,0,0)),
       until => Time::Local::timelocal(reverse(2004-1900,5-1,2,6,0,0)),
       file  => "kreuzberg-20020501.bbd",
       text  => "m�gliche Behinderungen zum 1. Mai in Kreuzberg",
     },
     { from  => 1083232800, # 2004-04-29 12:00
       until => 1083448800, # 2004-05-02 00:00
       file  => 'reinhardtstr.bbd',
       text  => 'Reinhardtstra�e zwischen Friedrichstra�e und Albrechtstra�e in beiden Richtungen gesperrt, Veranstaltung. Dauer: 30.04.2004, 12:00 Uhr bis 01.05.2004, 24:00 Uhr',
       type  => 'gesperrt',
     },
     { from  => 1083294000, # 2004-04-30 05:00
       until => 1083448800, # 2004-05-02 00:00
       file  => 'spandauer.bbd',
       text  => 'Spandauer Stra�e, zwischen Karl-Liebknecht-Stra�e und M�hlendamm, in beiden Richtungen Stra�e gesperrt. Veranstaltung. Dauer: 01.05.2004, 05.00 Uhr bis 24.00 Uhr',
       type  => 'gesperrt',
     },
     { from  => 1083189600, # 2004-04-29 00:00
       until => 1083535199, # 2004-05-02 23:59
       file  => 'muellerstr.bbd',
       text  => 'NEW: M�llerstr. (Wedding) in beiden Richtungen, zwischen Seestr. und Leopoldplatz Veranstaltung, Stra�enfest (vom 30.04. - 02.05.)',
       type  => 'gesperrt',
     },
    );
