(:jquery?:)
(:return titles of all books under 40:)
(:doc("Books.xml")/books/book[price<40]/title:)

(:same output using FLWOR:)
(:for $x in doc("Books.xml")/books/book:)
(:where $x/price<40:)
(:order by $x/title:)
(:return $x/title:)


(:3rd eg. title mapped to x, make html && put xquery in curly brackets{}, use data() to pull text instead of <title>data:)
(:<ul>:)
(:{:)
(:for $x in doc("Books.xml")/books/book/title:)
(:where $x/price<40:)
(:order by $x:)
(:return <li>{data($x)}</li>:)
(:}:)
(:</ul>:)


(:eg 4 using if statements:)
(:<ul>:)
    (:{:)
        (:for $x in doc("Books.xml")/books/book:)
        (:return if ($x/@category = "XML") then <XMLBOOK>{data($x/title)}</XMLBOOK>:)
        (:else <NONXMLBOOK>{data($x/title)}</NONXMLBOOK>:)
    (:}:)
(:</ul>:)

(:eg 5 using small changes like uppercase:)
<ul>
    {
        for $x in doc("Books.xml")/books/book
        return if ($x/@category = "XML") then <XMLBOOK>{fn:upper-case($x/title)}</XMLBOOK>
        else <NONXMLBOOK>{fn:substring($x/title,1,4)}</NONXMLBOOK>
    }
</ul>