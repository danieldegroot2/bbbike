# -*- perl -*-

package Bundle::BBBike;

$VERSION = sprintf("%d.%02d", q$Revision: 2.2 $ =~ /(\d+)\.(\d+)/);

1;

__END__

=head1 NAME

Bundle::BBBike - A bundle to install all dependencies of BBBike

=head1 SYNOPSIS

 perl -MCPAN -e 'install Bundle::BBBike'

=head1 CONTENTS

Tk 402.002	- das absolute Muss!

Tk::FireButton	- "Firebutton"-Funktionalit�t f�r die Windrose

Tk::Pod 2.8	- Online-Hilfe

Tk::FontDialog	- zum �ndern des Zeichensatzes aus dem Programm heraus

Tk::JPEG

Tie::Watch

Tk::HistEntry

Tk::Stderr	- optionales Redirect von Fehlermeldungen in ein Tk-Fenster

LWP::UserAgent	- f�r die WWW-Verbindungen (Stadtplan und Wetterbericht)

Image::Magick	- f�r Bildmanipulationen beim Radar-Bild der FU

Apache::Session::DB_File	- optionale Session-Verwaltung f�r das CGI-Programm

XML::SAX	- CPAN.pm kann XML::SAX nicht �ber XML::Simple automatisch installieren

XML::Simple	- optional f�r XML-Dumps der BBBike-Route

YAML	- optional f�r YAML-Dumps der BBBike-Route

Mail::Send	- falls man aus bbbike heraus E-Mails mit der Routenbeschreibung verschicken will

String::Approx 2.7	- oder man verwendet agrep (mindestens Version 3.0)

Storable	- f�r das Caching beim CGI-Programm

MLDBM

GD 1.18	- zum On-the-fly-Erzeugen von Grafiken beim CGI-Programm

Chart::ThreeD::Pie	- Tortendiagramme in der Statistik

List::Permutor	- F�r das Problem des Handlungsreisenden

PDF::Create 0.06	- Erzeugung der Route als PDF-Dokument --- die neueste Version ist nur auf sourceforge erh�ltlich! (http://prdownloads.sourceforge.net/perl-pdf/perl-pdf-0.06.1b.tar.gz?download)

BSD::Resource

Devel::Peek

Statistics::Descriptive

Math::MatrixReal

Class::Accessor	- f�r GPS::GpsmanData, die ESRI-Module etc.

Template	- f�r BBBikeDraw::MapServer

Inline::C	- f�r den schnelleren Suchalgorithmus, siehe ext/Strassen-Inline

Pod::Usage	- f�r das Ausgeben der 'Usage' in einigen Entwicklungs-Tools

Palm::PalmDoc	- f�r das Erzeugen von palmdoc-Dateien mit der Routenbeschreibung

Astro::Sunrise	- Anzeige des Sonnenuntergangs/-aufgangs im Info-Fenster

File::ReadBackwards	- LogTracker plugin

Date::Calc	- LogTracker plugin

XBase	- Erzeugen der Mapserver- oder anderer ESRI-Dateien

IPC::Run	- hilft bei der sicheren Ausf�hrung von externen Kommandos (insbesondere f�r Win32)

Imager	- additional optional BBBikeDraw backend for PNG graphics

SVG	- additional optional BBBikeDraw backend for SVG graphics

Image::Info

Test::More



=head1 DESCRIPTION

Dieses BE<uuml>ndel listet alle erforderlichen und empfohlenen Module
fE<uuml>r BBBike auf. Bis auf B<Tk> sind alle anderen Module optional.

This bundle lists all required and optional perl modules for BBBike.
Only B<Tk> is really required, all other modules are optional.

=head1 AUTHOR

Slaven Rezic <slaven@rezic.de>

=cut
