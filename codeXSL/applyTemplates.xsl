<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <b>This is xslt template 2 with diff temp match=</b>
                <b></b>
                <b>Order ID:</b>
                <xsl:value-of select="Order/@id"/>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="CustomerName">
        <br/><br/>the name of this person is :
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="Item">
        <br/><br/>the item name for this is :
        <xsl:value-of select="ItemName"/>
        Price of this item is :
        <xsl:value-of select="Price"/>
    </xsl:template>
</xsl:stylesheet>