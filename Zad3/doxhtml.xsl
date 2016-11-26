<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xhtml" version="1.0" encoding="utf-8"
	doctype-public="-//W3C//DTD XHTML 1.1//EN"
	doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"/>

<xsl:key name="aut" match="aut" use="@id"/>
<xsl:key name="dział" match="dział" use="@id"/>

<xsl:template match="/">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Biblioteka</title>
	</head>
	<body>
	<table border="1">
		<tbody>
	    <tr>
		    <th>Autor</th>
		    <th>Tytuł</th>
		    <th>Strony</th>
		    <th>Dział</th>
		    <th>Ocena</th>
		    <th>Cena</th>
		</tr>
		<xsl:for-each select="Zadanie3/książki/książka">
			<xsl:sort order="descending" select="ocena_użytkowników" data-type="number"/>
			<xsl:if test="strony &gt; 500">
			<tr>
				<th><xsl:value-of select="autor/key('aut', @aut)"/></th>
				<td><xsl:value-of select="tytuł"/></td>
				<th><xsl:value-of select="strony"/></th>
				<th><xsl:value-of select="dział_książki/key('dział', @dział)"/></th>
				<th><xsl:value-of select="ocena_użytkowników"/></th>
				<th><xsl:value-of select="cena"/></th>	
			</tr>
			</xsl:if>
		</xsl:for-each>
		</tbody>
	</table>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>
