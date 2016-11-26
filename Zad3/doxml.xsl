<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes"/>
<xsl:key name="aut" match="aut" use="@id"/>
<xsl:key name="dział" match="dział" use="@id"/>

<xsl:template match="/">
	
	<Zadanie3>
	<xsl:for-each select="Zadanie3/książki/książka">
		<xsl:sort order="descending" select="ocena_użytkowników" data-type="number"/>
		<xsl:if test="strony &gt; 500">
		<book>
			<author><xsl:value-of select="autor/key('aut', @aut)"/></author>
			<title><xsl:value-of select="tytuł"/></title>
			<pages><xsl:value-of select="strony"/></pages>
			<genre><xsl:value-of select="dział_książki/key('dział', @dział)"/></genre>
			<rating><xsl:value-of select="ocena_użytkowników"/></rating>	
			<price><xsl:value-of select="cena"/></price>		
		</book>
		</xsl:if>
	</xsl:for-each>
	<podsumowanie>
	<liczba_książek><xsl:value-of select="count(//książka[strony &gt; 500]/tytuł)"/></liczba_książek>
	<liczba_autorów><xsl:value-of select="count(//książka[strony &gt; 500]/autor/key('aut', @aut))"/></liczba_autorów>
	<liczba_działów><xsl:value-of select="count(//książka[strony &gt; 500]/dział_książki/key('dział', @dział))"/></liczba_działów>
	<średnia_cena_wszystkich><xsl:value-of select="sum(//cena) div count(//książka)"/></średnia_cena_wszystkich>
	<średnia_cena_wybranych><xsl:value-of select="sum(//książka[strony &gt; 500]/cena) div count(//książka[strony &gt; 500])"/></średnia_cena_wybranych>
	<data_wygenerowania><xsl:value-of  select="current-date()"/></data_wygenerowania>
	<!--                                       ^do tego trzeba było zmienić wersje stylesheet do 2.0 -->
	</podsumowanie>
	</Zadanie3>
	
</xsl:template>
</xsl:stylesheet>
