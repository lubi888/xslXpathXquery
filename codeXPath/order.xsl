<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h1>Order Information: all items || item 3</h1>
                <!--keep this in to get info on all items/-->
                <xsl:apply-templates/>
                <br></br>
                <p>
                    The total number of nodes|items is :
                    <xsl:value-of select="count(/Order/Item)"/>
                </p>
                <p>
                    The total price of the order is :
                    <xsl:value-of select="sum(/Order/Item/Price)"/>
                </p>
                <!--the following line is how to select a particular node by its attribute: Item/@id=3-->
                <!--<xsl:apply-templates select="/Order/Item[@id='3']"/>-->

                <!--extracting substrings-->
                <!--substring(string, startPos, numOfChars)-->
                <!--substring-before(string,char)-->
                <!--substring-after(string,char)-->
                <br/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="CustomerName">
        <br>Customer name :
            <xsl:value-of select="/Order/CustomerName"/>
        </br>
    </xsl:template>

    <xsl:template match="Item">
        <br/>Order id :
        <xsl:value-of select="./@id"/>
        <br/>Item name :
        <xsl:value-of select="./ItemName"/>
        <br/>Item name substring 2,5:
        <xsl:value-of select="substring(./ItemName,2,5)"/>
        <br/>Item name translated:
        <xsl:value-of select="translate(./ItemName, 'abcdefghijklmnopqrstuvwxyzP', 'ABCDEFGHIJKLMNOPQRSTUVWXYZp')"/>
        <br/>Price :
        <!-- rounding: ceiling, floor, round (.5 round up or down)-->
        <xsl:value-of select="round(./Price)"/>
        <xsl:if test="Price &gt; 100">(You are eligible for free shipping)</xsl:if>
        <xsl:if test="Price &lt; 100">(try purchasing another item to sum over 100 for free shippping)</xsl:if>
    </xsl:template>
</xsl:stylesheet>