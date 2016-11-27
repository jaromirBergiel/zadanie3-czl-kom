<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>
<xsl:key name="aut" match="aut" use="@id"/>
<xsl:key name="dział" match="dział" use="@id"/>

<xsl:template match="/">
	<Zadanie3>
		<Książki_Powyżej500_stron>
			<xsl:for-each select="Zadanie3/książki/książka">
				<xsl:sort order="descending" select="ocena_użytkowników" data-type="number"/>
				<xsl:if test="strony &gt; 500">
				<book>
					<author><xsl:value-of select="autor/key('aut', @aut)"/></author>
					<title><xsl:value-of select="tytuł"/></title>
					<pages><xsl:value-of select="strony"/></pages>
					<genre><xsl:value-of select="dział_książki/key('dział', @dział)"/></genre>
					<rating><xsl:apply-templates select="ocena_użytkowników"/></rating>	
					<price><xsl:value-of select="cena"/> <xsl:value-of select="cena/@waluta"/></price>
					<vat><xsl:value-of select='format-number(cena*0.23, "#.00")'/> <xsl:value-of select="cena/@waluta"/></vat>		
				</book>
				</xsl:if>
			</xsl:for-each>
		</Książki_Powyżej500_stron>
		<Książki_Poniżej500_stron>
			<xsl:for-each select="Zadanie3/książki/książka">
				<xsl:sort order="descending" select="ocena_użytkowników" data-type="number"/>
				<xsl:if test="strony &lt; 500">
				<book>
					<author><xsl:value-of select="autor/key('aut', @aut)"/></author>
					<title><xsl:value-of select="tytuł"/></title>
					<pages><xsl:value-of select="strony"/></pages>
					<genre><xsl:value-of select="dział_książki/key('dział', @dział)"/></genre>
					<rating><xsl:apply-templates select="ocena_użytkowników"/></rating>	
					<price><xsl:value-of select="cena"/> <xsl:value-of select="cena/@waluta"/></price>
					<vat><xsl:value-of select='format-number(cena*0.23, "#.00")'/> <xsl:value-of select="cena/@waluta"/></vat>		
				</book>
				</xsl:if>
			</xsl:for-each>
		</Książki_Poniżej500_stron>
		<Autorzy_narodowość>
			<xsl:for-each select="Zadanie3/autorzy/aut">
				<xsl:choose>
					<xsl:when test="@narodowość = 'Polak'">
						<Polak><xsl:value-of select="."/></Polak>
					</xsl:when>
					<xsl:when test="@narodowość = 'Anglik'">
						<Anglik><xsl:value-of select="."/></Anglik>
					</xsl:when>
					<xsl:when test="@narodowość = 'Amerykanin'">
						<Amerykanin><xsl:value-of select="."/></Amerykanin>
					</xsl:when>
					<xsl:when test="@narodowość = 'Szwajcar'">
						<Szwajcar><xsl:value-of select="."/></Szwajcar>
					</xsl:when>
					<xsl:otherwise>
						<Inne><xsl:value-of select="."/></Inne>
					</xsl:otherwise>
				</xsl:choose>

			</xsl:for-each>		
		</Autorzy_narodowość>
	<Podsumowanie>
		<Ksiązki>
			<liczba_książek_ogółem><xsl:value-of select="count(//książka)"/></liczba_książek_ogółem>
			<liczba_książek_powyżej500str><xsl:value-of select="count(//książka[strony &gt; 500]/tytuł)"/></liczba_książek_powyżej500str>
			<liczba_książek_poniżej500str><xsl:value-of select="count(//książka[strony &lt; 500]/tytuł)"/></liczba_książek_poniżej500str>
		</Ksiązki>
		<Autorzy>
			<liczba_autorów_ogółem><xsl:value-of select="count(//książka/autor/key('aut', @aut))"/></liczba_autorów_ogółem>
			<liczba_autorów_powyżej500str><xsl:value-of select="count(//książka[strony &gt; 500]/autor/key('aut', @aut))"/></liczba_autorów_powyżej500str>
			<liczba_autorów_poniżej500str><xsl:value-of select="count(//książka[strony &lt; 500]/autor/key('aut', @aut))"/></liczba_autorów_poniżej500str>
		</Autorzy>
		<Działy>
			<liczba_działów__książek_ogółem><xsl:value-of select="count(//książka/dział_książki/key('dział', @dział))"/></liczba_działów__książek_ogółem>
			<liczba_działów__książek_powyżej500str><xsl:value-of select="count(//książka[strony &gt; 500]/dział_książki/key('dział', @dział))"/></liczba_działów__książek_powyżej500str>
			<liczba_działów__książek_poniżej500str><xsl:value-of select="count(//książka[strony &lt; 500]/dział_książki/key('dział', @dział))"/></liczba_działów__książek_poniżej500str>
		</Działy>
		<Inne>
			<średnia_cena_wszystkich><xsl:value-of select='format-number(sum(//cena) div count(//książka), "#.00")'/></średnia_cena_wszystkich>
			<średnia_cena_książek_powyzej500><xsl:value-of select='format-number(sum(//książka[strony &gt; 500]/cena) div count(//książka[strony &gt; 500]), "#.00")'/></średnia_cena_książek_powyzej500>
			<średnia_cena_książek_ponizej500><xsl:value-of select='format-number(sum(//książka[strony &lt; 500]/cena) div count(//książka[strony &gt; 500]), "#.00")'/></średnia_cena_książek_ponizej500>
			<data_wygenerowania><xsl:value-of  select="format-dateTime(current-dateTime(), 'Data: [D01]/[M01]/[Y0001] | Godzina: [H1]:[m01]') "/></data_wygenerowania>
			<!--                                       ^do tego trzeba było zmienić wersje stylesheet do 2.0 -->
		</Inne>
		

	</Podsumowanie>
	</Zadanie3>
	
</xsl:template>

<xsl:template match="ocena_użytkowników">
  <xsl:value-of select="."/> gwiazdek</xsl:template>

</xsl:stylesheet>
