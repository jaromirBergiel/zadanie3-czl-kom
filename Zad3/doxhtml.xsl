<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xhtml" version="1.0" encoding="utf-8"
	doctype-public="-//W3C//DTD XHTML 1.1//EN"
	doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"/>

<xsl:template match="/">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Biblioteka</title>
	</head>
	<body>
	<table border="1" title="książki_ponad_500s" >
		<tbody>
		<caption><b>Ranking książek powyżej 500 stron</b></caption>
	    <tr bgcolor="#9acd32">
		    <th>Autor</th>
		    <th>Tytuł</th>
		    <th>Strony</th>
		    <th>Dział</th>
		    <th>Cena</th>
		    <th>Ocena</th>
		</tr>
		<xsl:for-each select="Zadanie3/Książki_Powyżej500_stron/book">
			<xsl:sort order="descending" select="rating" data-type="number"/>
			<xsl:if test="pages &gt; 500">
			<tr>
				<th><xsl:value-of select="author"/></th>
				<td><xsl:value-of select="title"/></td>
				<th><xsl:value-of select="pages"/></th>
				<th><xsl:value-of select="genre"/></th>
				<th><xsl:value-of select="price"/></th>	
				<th><xsl:value-of select="rating"/></th>
			</tr>
			</xsl:if>
		</xsl:for-each>
		</tbody>
	</table>
	<br/><br/>
	<table border="1" title="książki_poniżej_500s">
		<tbody>
		<caption><b>Ranking książek poniżej 500 stron</b></caption>
	    <tr bgcolor="#9acd32">
		    <th>Autor</th>
		    <th>Tytuł</th>
		    <th>Strony</th>
		    <th>Dział</th>
		    <th>Cena</th>
		    <th>Ocena</th>
		</tr>
		<xsl:for-each select="Zadanie3/Książki_Poniżej500_stron/book">
			<xsl:sort order="descending" select="rating" data-type="number"/>
			<xsl:if test="pages &lt; 500">
			<tr>
				<th><xsl:value-of select="author"/></th>
				<td><xsl:value-of select="title"/></td>
				<th><xsl:value-of select="pages"/></th>
				<th><xsl:value-of select="genre"/></th>
				<th><xsl:value-of select="price"/></th>	
				<th><xsl:value-of select="rating"/></th>
			</tr>
			</xsl:if>
		</xsl:for-each>
		</tbody>
	</table>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>
