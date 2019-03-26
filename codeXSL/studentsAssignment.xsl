<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- namespace uniqueness -->
    <xsl:template match="/">
        <html>
            <body>
                <h2>Here are the student scores
                </h2>
                <h3>
                    <b>College Name :
                        <xsl:value-of select="StudentScores/College"/>
                    </b>
                </h3>
                <table border="2">
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Points</th>
                        <th>Grade</th>
                    </tr>
                    <tr>sorted by grade result descending</tr>
                    <xsl:for-each select="StudentScores/Student">
                        <xsl:sort select="Score" data-type="number" order="descending"/>
                        <tr>
                            <td>
                                <xsl:value-of select="FirstName"/>
                            </td>
                            <td>
                                <xsl:value-of select="LastName"/>
                            </td>
                            <td>
                                <xsl:value-of select="Score"/>
                            </td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="Score>=90">
                                        <b>A</b>
                                    </xsl:when>
                                    <xsl:when test="Score>=80">
                                        <b>B</b>
                                    </xsl:when>
                                    <xsl:when test="Score>=70">
                                        <!--otherwise-->
                                        <b>C</b>
                                    </xsl:when>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
