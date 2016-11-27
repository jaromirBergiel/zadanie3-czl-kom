<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="output-namespace" select="'http://www.w3.org/1999/xhtml'"/>

<xsl:output method="xhtml" version="1.0" encoding="utf-8"
	doctype-public="-//W3C//DTD XHTML 1.1//EN"
	doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"/>

<xsl:template match="/">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Biblioteka</title>
	</head>
	<body>

		<h4>Ranking książek powyżej 500 stron</h4>
		<table border="1" title="książki_ponad_500s" >
			<tbody>
		    <tr>
			    <th>Autor</th>
			    <th>Tytuł</th>
			    <th>Strony</th>
			    <th>Dział</th>
			    <th>Cena</th>
			    <th>VAT</th>
			    <th>Ocena</th>
			</tr>
			<xsl:for-each select="Zadanie3/Książki_Powyżej500_stron/book">
				<xsl:sort order="descending" select="rating" data-type="number"/>
				<xsl:if test="pages &gt; 500">
				<tr>
					<td><xsl:value-of select="author"/></td>
					<td><xsl:value-of select="title"/></td>
					<td><xsl:value-of select="pages"/></td>
					<td><xsl:apply-templates select="genre"/></td>
					<td><xsl:value-of select="price"/></td>	
					<td><xsl:value-of select="vat"/></td>
					<th><xsl:value-of select="rating"/></th>
				</tr>
				</xsl:if>
			</xsl:for-each>
			</tbody>
		</table>
		<h4>Ranking książek poniżej 500 stron</h4>
		<table border="1" title="książki_poniżej_500s">
			<tbody>
		    <tr>
			    <th>Autor</th>
			    <th>Tytuł</th>
			    <th>Strony</th>
			    <th>Dział</th>
			    <th>Cena</th>
			    <th>VAT</th>
			    <th>Ocena</th>
			</tr>
			<xsl:for-each select="Zadanie3/Książki_Poniżej500_stron/book">
				<xsl:sort order="descending" select="rating" data-type="number"/>
				<xsl:if test="pages &lt; 500">
				<tr>
					<td><xsl:value-of select="author"/></td>
					<td><xsl:value-of select="title"/></td>
					<td><xsl:value-of select="pages"/></td>
					<xsl:apply-templates select="genre"/>
					<td><xsl:value-of select="price"/></td>
					<td><xsl:value-of select="vat"/></td>		
					<th><xsl:value-of select="rating"/></th>
				</tr>
				</xsl:if>
			</xsl:for-each>
			</tbody>
		</table>
		<h4>Narodowość autorów</h4>
		<xsl:for-each select="Zadanie3/Autorzy_narodowość">
	      <xsl:choose>
	        <xsl:when test="Polak">
	          <p><xsl:value-of select="Polak"/> jest narodowości polskiej</p>
	        </xsl:when>
	        <xsl:when test="Amerykanin">
	          <p><xsl:value-of select="Amerykanin"/> jest narodowości amerykańskiej</p>
	        </xsl:when>
	        <xsl:when test="Szwajcar">
	          <p><xsl:value-of select="Szwajcar"/> jest narodowości szwajcarskiej</p>
	        </xsl:when>
	      
	        <xsl:when test="Anglik">
	          <p><xsl:value-of select="Anglik"/> jest narodowości angielskiej</p>
	        </xsl:when>
	        <xsl:otherwise>
	          Inna narodowość
	        </xsl:otherwise>
	      </xsl:choose>
    
    	</xsl:for-each>
		<h2>Podsumowanie:</h2>
			<h4>Książki</h4>
			<ol>
		  		<li><b><i>Książki ogółem: </i></b><xsl:value-of select="Zadanie3/Podsumowanie/Ksiązki/liczba_książek_ogółem"/></li>
		  		<li><b><i>Książki powyżej 500 str: </i></b><xsl:value-of select="Zadanie3/Podsumowanie/Ksiązki/liczba_książek_powyżej500str"/></li>
		  		<li><b><i>Książki poniżej 500 str: </i></b><xsl:value-of select="Zadanie3/Podsumowanie/Ksiązki/liczba_książek_poniżej500str"/></li>
		 	</ol>
		 	<h4>Autorzy</h4>
			<ol>
		  		<li><b><i>Autorzy ogółem: </i></b><xsl:value-of select="Zadanie3/Podsumowanie/Autorzy/liczba_autorów_ogółem"/></li>
		  		<li><b><i>Autorzy książek powyżej 500 str: </i></b><xsl:value-of select="Zadanie3/Podsumowanie/Autorzy/liczba_autorów_powyżej500str"/></li>
		  		<li><b><i>Autorzy książek poniżej 500 str: </i></b><xsl:value-of select="Zadanie3/Podsumowanie/Autorzy/liczba_autorów_poniżej500str"/></li>
		 	</ol>
		 	<h4>Działy</h4>
			<ol>
		  		<li><b><i>Liczba działów dla wszystkich książek: </i></b><xsl:value-of select="Zadanie3/Podsumowanie/Działy/liczba_działów__książek_ogółem"/></li>
		  		<li><b><i>Liczba działów dla książek &gt; 500str: </i></b><xsl:value-of select="Zadanie3/Podsumowanie/Działy/liczba_działów__książek_powyżej500str"/></li>
		  		<li><b><i>Liczba działów dla książek &lt; 500str: </i></b><xsl:value-of select="Zadanie3/Podsumowanie/Działy/liczba_działów__książek_poniżej500str"/></li>
		 	</ol>
		 	<h4>Inne zestawienia</h4>
			<ol>
		  		<li><b><i>Średnia cena wszystkich książek: </i></b><xsl:value-of select="Zadanie3/Podsumowanie/Inne/średnia_cena_wszystkich"/></li>
		  		<li><b><i>Średnia cena książek &gt; 500str: </i></b><xsl:value-of select="Zadanie3/Podsumowanie/Inne/średnia_cena_książek_powyzej500"/></li>
		  		<li><b><i>Średnia cena książek &lt; 500str: </i></b><xsl:value-of select="Zadanie3/Podsumowanie/Inne/średnia_cena_książek_ponizej500"/></li>
		  		<li><b><i>Data wygenerowania: </i></b><xsl:value-of select="Zadanie3/Podsumowanie/Inne/data_wygenerowania"/> </li>
		 	</ol>
	</body>
	</html>
	</xsl:template>
	
	<xsl:template match="genre">
	<xsl:element name="font" namespace="{$output-namespace}">
			<xsl:attribute name="size"><xsl:value-of select="3"/></xsl:attribute>
			<xsl:attribute name="color"><xsl:value-of select="'red'"/></xsl:attribute>
		<xsl:value-of select="node()"/>
	</xsl:element>
	</xsl:template>
</xsl:stylesheet>
