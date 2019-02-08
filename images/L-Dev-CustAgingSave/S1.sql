
CREATE PROC [demo].[Northwind_Credit_Save_MyName]

    -- System Params not in formula
     @Interject_RequestContext nvarchar(max)
    ,@Interject_ReturnError varchar(2000) OUTPUT
    ,@TestMode bit = 0 -- used only for testing the stored procedure directly.  It will show more results when set to 1.


AS

/*
==================================================================================
    CREATED DATE:
    CREATED BY: Interject Default
    DESCRIPTION: Example data pull to be used with Interject
    
    ---------------------------------------------------------------------------
    TEST Example: Use the below to test this stored procedure:
    ---------------------------------------------------------------------------
    
    DECLARE @Interject_ReturnError varchar(2000)

    EXEC [demo].[Northwind_Credit_Save_MyName]
        @TestMode = 1
        ,@Interject_RequestContext = '<?xml version="1.0" encoding="utf-16" standalone="yes"?>
<RequestContext>
    <ExcelVersion></ExcelVersion>
    <IdsVersion></IdsVersion>
    <FileName></FileName>
    <FilePath></FilePath>
    <TabName></TabName>
    <CellRange>C11</CellRange>
    <SourceFunction>Save</SourceFunction>
    <UtcOffset>-7</UtcOffset>
    <ColDefItems>
        <Value Row="4" Column="2">
            <Name>CustomerID</Name>
        </Value>
        <Value Row="4" Column="8">
            <Name>CreditLimit</Name>
        </Value>
        <Value Row="4" Column="11">
            <Name>AccountFreeze</Name>
        </Value>
        <Value Row="4" Column="13">
            <Name>AccountNotes</Name>
        </Value>
    </ColDefItems>
    <ResultDefItems>
        <Value Row="6" Column="14">
            <Name>[MessageToUser]</Name>
        </Value>
    </ResultDefItems>
    <RowDefItems>
        <Value Row="27" Column="2" ColumnName="CustomerID">
            <Name>ALFKI</Name>
        </Value>
        <Value Row="28" Column="2" ColumnName="CustomerID">
            <Name>ANATR</Name>
        </Value>
        <Value Row="29" Column="2" ColumnName="CustomerID">
            <Name>ANTON</Name>
        </Value>
        <Value Row="30" Column="2" ColumnName="CustomerID">
            <Name>AROUT</Name>
        </Value>
        <Value Row="31" Column="2" ColumnName="CustomerID">
            <Name>BERGS</Name>
        </Value>
        <Value Row="32" Column="2" ColumnName="CustomerID">
            <Name>BLONP</Name>
        </Value>
        <Value Row="33" Column="2" ColumnName="CustomerID">
            <Name>BONAP</Name>
        </Value>
        <Value Row="34" Column="2" ColumnName="CustomerID">
            <Name>BOTTM</Name>
        </Value>
        <Value Row="35" Column="2" ColumnName="CustomerID">
            <Name>BSBEV</Name>
        </Value>
        <Value Row="36" Column="2" ColumnName="CustomerID">
            <Name>CACTU</Name>
        </Value>
        <Value Row="37" Column="2" ColumnName="CustomerID">
            <Name>CENTC</Name>
        </Value>
        <Value Row="38" Column="2" ColumnName="CustomerID">
            <Name>CHOPS</Name>
        </Value>
        <Value Row="39" Column="2" ColumnName="CustomerID">
            <Name>WANDK</Name>
        </Value>
        <Value Row="40" Column="2" ColumnName="CustomerID">
            <Name>DRACD</Name>
        </Value>
        <Value Row="41" Column="2" ColumnName="CustomerID">
            <Name>DUMON</Name>
        </Value>
        <Value Row="42" Column="2" ColumnName="CustomerID">
            <Name>EASTC</Name>
        </Value>
        <Value Row="43" Column="2" ColumnName="CustomerID">
            <Name>ERNSH</Name>
        </Value>
        <Value Row="44" Column="2" ColumnName="CustomerID">
            <Name>FAMIA</Name>
        </Value>
        <Value Row="45" Column="2" ColumnName="CustomerID">
            <Name>FOLIG</Name>
        </Value>
        <Value Row="46" Column="2" ColumnName="CustomerID">
            <Name>FOLKO</Name>
        </Value>
        <Value Row="47" Column="2" ColumnName="CustomerID">
            <Name>FRANR</Name>
        </Value>
        <Value Row="48" Column="2" ColumnName="CustomerID">
            <Name>FRANS</Name>
        </Value>
        <Value Row="49" Column="2" ColumnName="CustomerID">
            <Name>FRANK</Name>
        </Value>
        <Value Row="50" Column="2" ColumnName="CustomerID">
            <Name>FURIB</Name>
        </Value>
        <Value Row="51" Column="2" ColumnName="CustomerID">
            <Name>GALED</Name>
        </Value>
        <Value Row="52" Column="2" ColumnName="CustomerID">
            <Name>GODOS</Name>
        </Value>
        <Value Row="53" Column="2" ColumnName="CustomerID">
            <Name>GOURL</Name>
        </Value>
        <Value Row="54" Column="2" ColumnName="CustomerID">
            <Name>GREAL</Name>
        </Value>
        <Value Row="55" Column="2" ColumnName="CustomerID">
            <Name>HANAR</Name>
        </Value>
        <Value Row="56" Column="2" ColumnName="CustomerID">
            <Name>HILAA</Name>
        </Value>
        <Value Row="57" Column="2" ColumnName="CustomerID">
            <Name>HUNGC</Name>
        </Value>
        <Value Row="58" Column="2" ColumnName="CustomerID">
            <Name>HUNGO</Name>
        </Value>
        <Value Row="59" Column="2" ColumnName="CustomerID">
            <Name>ISLAT</Name>
        </Value>
        <Value Row="60" Column="2" ColumnName="CustomerID">
            <Name>KOENE</Name>
        </Value>
        <Value Row="61" Column="2" ColumnName="CustomerID">
            <Name>LACOR</Name>
        </Value>
        <Value Row="62" Column="2" ColumnName="CustomerID">
            <Name>LAMAI</Name>
        </Value>
        <Value Row="63" Column="2" ColumnName="CustomerID">
            <Name>LAUGB</Name>
        </Value>
        <Value Row="64" Column="2" ColumnName="CustomerID">
            <Name>LEHMS</Name>
        </Value>
        <Value Row="65" Column="2" ColumnName="CustomerID">
            <Name>LETSS</Name>
        </Value>
        <Value Row="66" Column="2" ColumnName="CustomerID">
            <Name>LILAS</Name>
        </Value>
        <Value Row="67" Column="2" ColumnName="CustomerID">
            <Name>LINOD</Name>
        </Value>
        <Value Row="68" Column="2" ColumnName="CustomerID">
            <Name>LONEP</Name>
        </Value>
        <Value Row="69" Column="2" ColumnName="CustomerID">
            <Name>MAGAA</Name>
        </Value>
        <Value Row="70" Column="2" ColumnName="CustomerID">
            <Name>MEREP</Name>
        </Value>
        <Value Row="71" Column="2" ColumnName="CustomerID">
            <Name>MORGK</Name>
        </Value>
        <Value Row="72" Column="2" ColumnName="CustomerID">
            <Name>OCEAN</Name>
        </Value>
        <Value Row="73" Column="2" ColumnName="CustomerID">
            <Name>OLDWO</Name>
        </Value>
        <Value Row="74" Column="2" ColumnName="CustomerID">
            <Name>OTTIK</Name>
        </Value>
        <Value Row="75" Column="2" ColumnName="CustomerID">
            <Name>PERIC</Name>
        </Value>
        <Value Row="76" Column="2" ColumnName="CustomerID">
            <Name>PICCO</Name>
        </Value>
        <Value Row="77" Column="2" ColumnName="CustomerID">
            <Name>PRINI</Name>
        </Value>
        <Value Row="78" Column="2" ColumnName="CustomerID">
            <Name>QUEDE</Name>
        </Value>
        <Value Row="79" Column="2" ColumnName="CustomerID">
            <Name>QUEEN</Name>
        </Value>
        <Value Row="80" Column="2" ColumnName="CustomerID">
            <Name>QUICK</Name>
        </Value>
        <Value Row="81" Column="2" ColumnName="CustomerID">
            <Name>RANCH</Name>
        </Value>
        <Value Row="82" Column="2" ColumnName="CustomerID">
            <Name>RATTC</Name>
        </Value>
        <Value Row="83" Column="2" ColumnName="CustomerID">
            <Name>REGGC</Name>
        </Value>
        <Value Row="84" Column="2" ColumnName="CustomerID">
            <Name>RICAR</Name>
        </Value>
        <Value Row="85" Column="2" ColumnName="CustomerID">
            <Name>RICSU</Name>
        </Value>
        <Value Row="86" Column="2" ColumnName="CustomerID">
            <Name>SANTG</Name>
        </Value>
        <Value Row="87" Column="2" ColumnName="CustomerID">
            <Name>SAVEA</Name>
        </Value>
        <Value Row="88" Column="2" ColumnName="CustomerID">
            <Name>SEVES</Name>
        </Value>
        <Value Row="89" Column="2" ColumnName="CustomerID">
            <Name>SPECD</Name>
        </Value>
        <Value Row="90" Column="2" ColumnName="CustomerID">
            <Name>SPLIR</Name>
        </Value>
        <Value Row="91" Column="2" ColumnName="CustomerID">
            <Name>SUPRD</Name>
        </Value>
        <Value Row="92" Column="2" ColumnName="CustomerID">
            <Name>THECR</Name>
        </Value>
        <Value Row="93" Column="2" ColumnName="CustomerID">
            <Name>TOMSP</Name>
        </Value>
        <Value Row="94" Column="2" ColumnName="CustomerID">
            <Name>TORTU</Name>
        </Value>
        <Value Row="95" Column="2" ColumnName="CustomerID">
            <Name>TRADH</Name>
        </Value>
        <Value Row="96" Column="2" ColumnName="CustomerID">
            <Name>VAFFE</Name>
        </Value>
        <Value Row="97" Column="2" ColumnName="CustomerID">
            <Name>VICTE</Name>
        </Value>
        <Value Row="98" Column="2" ColumnName="CustomerID">
            <Name>VINET</Name>
        </Value>
        <Value Row="99" Column="2" ColumnName="CustomerID">
            <Name>WARTH</Name>
        </Value>
        <Value Row="100" Column="2" ColumnName="CustomerID">
            <Name>WELLI</Name>
        </Value>
        <Value Row="101" Column="2" ColumnName="CustomerID">
            <Name>WHITC</Name>
        </Value>
        <Value Row="102" Column="2" ColumnName="CustomerID">
            <Name>WILMK</Name>
        </Value>
        <Value Row="103" Column="2" ColumnName="CustomerID">
            <Name>WOLZA</Name>
        </Value>
    </RowDefItems>
    <UserContext>
    <MachineLoginName></MachineLoginName>
    <MachineName>.</MachineName>
    <FullName> </FullName>
    <UserId>UFR62JQWx4</UserId>
    <ClientId>CgCfW9qi</ClientId>
    <LoginName></LoginName>
    <LoginAuthTypeId>10</LoginAuthTypeId>
    <LoginDateUtc></LoginDateUtc>
    <UserRoles>
        <Role></Role>
    </UserRoles>
</UserContext>
    <UserContextEncrypted>Encrypted only through interject api protocol, not direct connection</UserContextEncrypted>
    <XMLDataToSave>
    <c Column="Row" OrigValue="Row" />
    <c Column="CustomerID" OrigValue="CustomerID" />
    <c Column="CreditLimit" OrigValue="CreditLimit" />
    <c Column="AccountFreeze" OrigValue="AccountFreeze" />
    <c Column="AccountNotes" OrigValue="AccountNotes" />
    <r>
    <Row>27</Row>
    <CustomerID>ALFKI</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>28</Row>
    <CustomerID>ANATR</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>29</Row>
    <CustomerID>ANTON</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>30</Row>
    <CustomerID>AROUT</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>31</Row>
    <CustomerID>BERGS</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>32</Row>
    <CustomerID>BLONP</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>33</Row>
    <CustomerID>BONAP</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>34</Row>
    <CustomerID>BOTTM</CustomerID>
    <CreditLimit>50000</CreditLimit>
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>35</Row>
    <CustomerID>BSBEV</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>36</Row>
    <CustomerID>CACTU</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>37</Row>
    <CustomerID>CENTC</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>38</Row>
    <CustomerID>CHOPS</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>39</Row>
    <CustomerID>WANDK</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>40</Row>
    <CustomerID>DRACD</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>41</Row>
    <CustomerID>DUMON</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>42</Row>
    <CustomerID>EASTC</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>43</Row>
    <CustomerID>ERNSH</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>44</Row>
    <CustomerID>FAMIA</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>45</Row>
    <CustomerID>FOLIG</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>46</Row>
    <CustomerID>FOLKO</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>47</Row>
    <CustomerID>FRANR</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>48</Row>
    <CustomerID>FRANS</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>49</Row>
    <CustomerID>FRANK</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>50</Row>
    <CustomerID>FURIB</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>51</Row>
    <CustomerID>GALED</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>52</Row>
    <CustomerID>GODOS</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>53</Row>
    <CustomerID>GOURL</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>54</Row>
    <CustomerID>GREAL</CustomerID>
    <CreditLimit>50000</CreditLimit>
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>55</Row>
    <CustomerID>HANAR</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>56</Row>
    <CustomerID>HILAA</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>57</Row>
    <CustomerID>HUNGC</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>58</Row>
    <CustomerID>HUNGO</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>59</Row>
    <CustomerID>ISLAT</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>60</Row>
    <CustomerID>KOENE</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>61</Row>
    <CustomerID>LACOR</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>62</Row>
    <CustomerID>LAMAI</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>63</Row>
    <CustomerID>LAUGB</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>64</Row>
    <CustomerID>LEHMS</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>65</Row>
    <CustomerID>LETSS</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>66</Row>
    <CustomerID>LILAS</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>67</Row>
    <CustomerID>LINOD</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>68</Row>
    <CustomerID>LONEP</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>69</Row>
    <CustomerID>MAGAA</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>70</Row>
    <CustomerID>MEREP</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>71</Row>
    <CustomerID>MORGK</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>72</Row>
    <CustomerID>OCEAN</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>73</Row>
    <CustomerID>OLDWO</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>74</Row>
    <CustomerID>OTTIK</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>75</Row>
    <CustomerID>PERIC</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>76</Row>
    <CustomerID>PICCO</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>77</Row>
    <CustomerID>PRINI</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>78</Row>
    <CustomerID>QUEDE</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>79</Row>
    <CustomerID>QUEEN</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>80</Row>
    <CustomerID>QUICK</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>81</Row>
    <CustomerID>RANCH</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>82</Row>
    <CustomerID>RATTC</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>83</Row>
    <CustomerID>REGGC</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>84</Row>
    <CustomerID>RICAR</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>85</Row>
    <CustomerID>RICSU</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>86</Row>
    <CustomerID>SANTG</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>87</Row>
    <CustomerID>SAVEA</CustomerID>
    <CreditLimit>90000</CreditLimit>
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>88</Row>
    <CustomerID>SEVES</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>89</Row>
    <CustomerID>SPECD</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>90</Row>
    <CustomerID>SPLIR</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>91</Row>
    <CustomerID>SUPRD</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>92</Row>
    <CustomerID>THECR</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>93</Row>
    <CustomerID>TOMSP</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>94</Row>
    <CustomerID>TORTU</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>95</Row>
    <CustomerID>TRADH</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>96</Row>
    <CustomerID>VAFFE</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>97</Row>
    <CustomerID>VICTE</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>98</Row>
    <CustomerID>VINET</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>99</Row>
    <CustomerID>WARTH</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>100</Row>
    <CustomerID>WELLI</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>101</Row>
    <CustomerID>WHITC</CustomerID>
    <CreditLimit>50000</CreditLimit>
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>102</Row>
    <CustomerID>WILMK</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    <r>
    <Row>103</Row>
    <CustomerID>WOLZA</CustomerID>
    <CreditLimit />
    <AccountFreeze />
    <AccountNotes />
    </r>
    </XMLDataToSave>
</RequestContext>'
        ,@Interject_ReturnError = @Interject_ReturnError OUTPUT

    SELECT 	@Interject_ReturnError as '@Interject_ReturnError'


    ---------------------------------------------------------------------------
    Validation Example:
    ---------------------------------------------------------------------------
    Note: By adding 'UserNotice:' to the error message, Interject will show the message in an alert box and not flag the formula with an error.
    Without it, the formula will show an error with the text the user can click into.
    
    IF @ParameterName = 'TheWrongValue'
    BEGIN
        RAISERROR ('UserNotice:You selected an invalid value. Unable to continue.',
        18, -- Severity,
        1) -- State)
        
        RETURN
    END
    
    ---------------------------------------------------------------------------
    Reserved Parameters:
    ---------------------------------------------------------------------------
    Note: If the below parameters are added to your stored procedure and to the
    dataportal parameter list, Interject will pass the related value automatically.
    
    @Interject_XMLDataToSave varchar(max) - Required for saving data. It contains XML for the designated cells values.
    @Interject_ColDefItems  varchar(max) - Provides the Column Definitions in XML designated within the report formula.
    @Interject_RowDefItems varchar(max) - Provides the Row Definitions in XML designated within the report formula.
    @Interject_SourceFileAndPath varchar(500) - Provides the path and file name delimited by '|' of the current file.
    @Interject_SourceFilePathAndTab varchar(1000) - Provides the path, file name and active tab name delimited by '|' of the current file.
    @Interject_LocalTimeZoneOffset money - Provides a number (0.000) that represents the offset of the users time to UTC time.
    @Interject_NTLogin varchar(50) - Provides the user's computer login name for their current session.
    @Interject_UserID varchar(50) - Provides the Interject User ID for their current session.
    @Interject_LoginName varchar(50) - Provides the Interject Full name for their current session.
    @Interject_ExcelVersion varchar(50) - Provides the users Excel version.
    @Interject_UserRoles varchar(1000) - Provides the Interject roles assigned to the user.
    @Interject_ClientID varchar(50) - Provides the Interject Client ID for their current session.
    @Interject_ReturnError varchar(2000) - Is an output parameter that can be used to return an error back to the user. Pass empty string for no error.
    @Interject_RequestContext nvarchar(max) - Provides all above request context and both the open text and encrypted version of the user context.

==================================================================================
*/

    --
    -- Use helper to extract data from Interject_RequestContext. Remove items that are not needed
    -- The helper stored procedure [dbo].[RequestContext_Parse] is required for this section to function 
    --
    
    DECLARE
        @ExcelVersion					NVARCHAR(100)
        ,@IdsVersion					NVARCHAR(100)	
        ,@FileName						NVARCHAR(1000)	
        ,@FilePath						NVARCHAR(1000)
        ,@TabName						NVARCHAR(1000)	
        ,@CellRange						NVARCHAR(100)	
        ,@SourceFunction				NVARCHAR(100)	
        ,@UtcOffset						DECIMAL(6,4)	
        ,@ColDefItemsDelimited			xml	
        ,@ResultDefItemsDelimited		xml	
        ,@RowDefItemsDelimited			xml
        ,@MachineLoginName				NVARCHAR(100)
        ,@MachineName					NVARCHAR(100)	
        ,@Interject_UserID				NVARCHAR(100)
        ,@Interject_ClientID			NVARCHAR(100)
        ,@Interject_LoginName			NVARCHAR(100)	
        ,@Interject_LoginAuthTypeID		INT		
        ,@Interject_LoginDateUTC		DATETIME
        ,@Interject_UserRolesDelimited	NVARCHAR(max)
        ,@UserContextEncrypted			NVARCHAR(4000)
        ,@Interject_XMLDataToSave	    xml	
    
    EXEC [dbo].[RequestContext_Parse]
        @Interject_RequestContext		= @Interject_RequestContext
        ,@ExcelVersion					 = @ExcelVersion			 OUTPUT
        ,@IdsVersion					 = @IdsVersion				 OUTPUT
        ,@FileName						 = @FileName				 OUTPUT
        ,@FilePath						 = @FilePath				 OUTPUT
        ,@TabName						 = @TabName					 OUTPUT
        ,@CellRange						 = @CellRange				 OUTPUT
        ,@SourceFunction				 = @SourceFunction			 OUTPUT
        ,@UtcOffset						 = @UtcOffset				 OUTPUT
        ,@ColDefItemsDelimited			 = @ColDefItemsDelimited	 OUTPUT
        ,@ResultDefItemsDelimited		 = @ResultDefItemsDelimited	 OUTPUT
        ,@RowDefItemsDelimited			 = @RowDefItemsDelimited	 OUTPUT
        ,@MachineLoginName				 = @MachineLoginName		 OUTPUT
        ,@MachineName					 = @MachineName				 OUTPUT
        ,@Interject_UserID				 = @Interject_UserID		 OUTPUT
        ,@Interject_ClientID			 = @Interject_ClientID		 OUTPUT
        ,@Interject_LoginName			 = @Interject_LoginName		 OUTPUT
        ,@Interject_LoginAuthTypeID		 = @Interject_LoginAuthTypeID OUTPUT
        ,@Interject_LoginDateUTC		 = @Interject_LoginDateUTC	 OUTPUT
        ,@Interject_UserRolesDelimited	 = @Interject_UserRolesDelimited	OUTPUT
        ,@UserContextEncrypted			 = @UserContextEncrypted	 OUTPUT
        ,@Interject_XMLDataToSave		 = @Interject_XMLDataToSave	 OUTPUT
    
    IF @TestMode = 1
    BEGIN
        SELECT
            @ExcelVersion					as '@ExcelVersion'
            ,@IdsVersion					as '@IdsVersion'
            ,@FileName						as '@FileName'
            ,@FilePath						as '@FilePath '
            ,@TabName						as '@TabName'
            ,@CellRange						as '@CellRange'
            ,@SourceFunction				as '@SourceFunction'
            ,@UtcOffset						as '@UtcOffset'
            ,@ColDefItemsDelimited			as '@ColDefItemsDelimited'
            ,@ResultDefItemsDelimited		as '@ResultDefItemsDelimited'
            ,@RowDefItemsDelimited			as '@RowDefItemsDelimited'
            ,@MachineLoginName				as '@MachineLoginName'
            ,@MachineName					as '@MachineName'
            ,@Interject_UserID				as '@Interject_UserID'
            ,@Interject_ClientID			as '@Interject_ClientID'
            ,@Interject_LoginName			as '@Interject_LoginName'
            ,@Interject_LoginAuthTypeID		as '@Interject_LoginAuthTypeID'
            ,@Interject_LoginDateUTC		as '@Interject_LoginDateUTC'
            ,@Interject_UserRolesDelimited	as '@Interject_UserRolesDelimited'
            ,@UserContextEncrypted			as '@UserContextEncrypted'
            ,@Interject_XMLDataToSave		as '@Interject_XMLDataToSave'
    END


    
    DECLARE @ErrorMessageToUser as varchar(1000) = ''
    
    --
    -- PROCESS THE XML DATA INTO TABLE VARIABLE
    -- varchar(max) is used for the data type by default.  Please change for the specific requirement.
    --
    
    DECLARE @DataToProcess TABLE
    (
        -- the below are system values used internally in this stored procedures
            [_ExcelRow] INT 
        ,[_MessageToUser] VARCHAR(500) DEFAULT('')
        -- Below are your columns expected from the spreadsheet that is calling this save stored procedure
        -- Please change the (max) to the expected length of the text input.  If limiting length, be sure to make the size larger than allowed so you can add validation to notify the user
    
        ,[CustomerID] VARCHAR(max)
        ,[CreditLimit] VARCHAR(max)
        ,[AccountFreeze] VARCHAR(max)
        ,[AccountNotes] VARCHAR(max)
        -- remove the following columns after updating this code for your real data.  These are used for validation illustrations only
        ,[ExampleColumnKey] INT
        ,[ExampleColumnValue] VARCHAR(100)
    )
    
    IF DATALENGTH(@Interject_XMLDataToSave) > 0 
    BEGIN
        declare @DataToProcessXML as XML
        -- Handle conversion of XML text into an XML variable.  
        BEGIN TRY
            SET @DataToProcessXML = CAST(@Interject_XMLDataToSave as XML)
        END TRY
        BEGIN CATCH
            SET @ErrorMessageToUser = 'Error in Parsing XML from Interject.  Error: ' + ERROR_MESSAGE()
            GOTO FinalResponseToUser
        END CATCH
        
        -- Insert the XML into the table variable for further processing
        INSERT into @DataToProcess(
            [_ExcelRow]
            -- The below columns are provided based on your column definitions in the ReportSave() function]
            ,[CustomerID]
            ,[CreditLimit]
            ,[AccountFreeze]
            ,[AccountNotes]

            -- The below columns are provided to help with this example.  Please remove.
            ,[ExampleColumnKey]
            ,[ExampleColumnValue]
        )
        SELECT
            -- The below row value is always provided by Interject
            T.c.value('./Row[1]', 'INT') as [_ExcelRow]
            -- The below columns are provided based on your column definitions in the ReportSave() function
            ,T.c.value('./CustomerID[1]', 'VARCHAR(max)') as [CustomerID]
            ,T.c.value('./CreditLimit[1]', 'VARCHAR(max)') as [CreditLimit]
            ,T.c.value('./AccountFreeze[1]', 'VARCHAR(max)') as [AccountFreeze]
            ,T.c.value('./AccountNotes[1]', 'VARCHAR(max)') as [AccountNotes]

            -- The below columns are provided to help with this example.  Please remove.
            ,T.c.value('./ExampleyColumnKey[1]', 'VARCHAR(100)') as [ExampleColumnKey]
            ,T.c.value('./ExampleColumnValue[1]', 'INT') as [ExampleColumnValue]
        FROM @DataToProcessXML.nodes('/XMLDataToSave/r') T(c)
    END
    
    -- TestMode is provided so a test save can be executed and all related data can be 
    -- easily viewed for testing while not effecting any data in the database
    IF @TestMode =1 
    BEGIN
        SELECT '@DataToProcess - After XML Processing' as ResultName
        SELECT * FROM @DataToProcess
    END
    
    --
    -- VALIDATION SECTION - Ensure inputs received from Excel are valid
    --
    
    -- Validate a stored procedure parameter input passed from the spreadsheet.  
    DECLARE @ParameterExample as varchar(50)  -- This is declared only to simulate a store procedure parameter
    IF @ParameterExample = 'TheWrongValue' and 'SkipThisExample' = 'True'
    BEGIN
        SET @ErrorMessageToUser = 'You selected an invalid value for ''Example Input''. Save aborted.'
        GOTO FinalResponseToUser
    END
    
    -- Validate that the details do not have duplicates on the primary key
    UPDATE m
    SET [_MessageToUser] = [_MessageToUser] + ', Duplicate key'
    FROM @DataToProcess m
    INNER JOIN
        (
            SELECT [ExampleColumnKey] 
            FROM @DataToProcess
            WHERE [ExampleColumnKey] <> ''
            GROUP BY [ExampleColumnKey]
            HAVING COUNT(1) > 1
        ) as t
        ON
            m.ExampleColumnKey = t.ExampleColumnKey
    
    -- Validate a column in a detail row, but don't exit if error since we can check multiple issues before notifing the user
    UPDATE @DataToProcess
    SET [_MessageToUser] = [_MessageToUser] + ', [ExampleColumnValue] is a required entry'
    WHERE [ExampleColumnValue] = ''
    
    -- Validate a column has valid text
    UPDATE @DataToProcess
    SET [_MessageToUser] = [_MessageToUser] + ', [ExampleColumnValue] must be either Yes or No'
    WHERE [ExampleColumnValue] IN ('Yes','No')
    
    -- Now check if there were any validation issues in the detail and stop processing if true
    IF EXISTS(SELECT 1 FROM @DataToProcess WHERE [_MessageToUser] <> '')
    BEGIN
        SET @ErrorMessageToUser = 'There were errors in the details of your input.  Please review the errors noted in each row.'
        GOTO FinalResponseToUser
    END
    
    IF @TestMode =1 
    BEGIN
        SELECT '@DataToProcess - After Validation' as ResultName
        SELECT * FROM @DataToProcess
    END
    
    --
    -- DATA UPDATE
    --
    
    -- This represents the table where the data would be updated to.  Remove this temp table since it is for example purposes only.
    CREATE TABLE #ExampleTableToUpdate 
    (
        [ExampleColumnKey]		INT PRIMARY KEY
        ,[ExampleColumnValue]	VARCHAR(100)

        ,[CustomerID] VARCHAR(max)
        ,[CreditLimit] VARCHAR(max)
        ,[AccountFreeze] VARCHAR(max)
        ,[AccountNotes] VARCHAR(max)
    )
    BEGIN TRY
        
        -- this table variable will log the changes to the target table so it can be used
        -- to return helpful feedback to the user about how the save action resulted
        DECLARE @ChangeLog as TABLE
        (
            [_ExcelRow] INT	-- will capture the source row that affected the target table
            ,[UpdateTypeCode] VARCHAR(10)  -- Will show UPDATE, INSERT, or DELETE
            ,[TargetTableKey] INT
        )
        
        BEGIN TRAN t1
            --
            --  use MERGE statement that UPDATES, INSERTS, and DELETES in one action
            --
            MERGE #ExampleTableToUpdate t -- t = the target table or view to update
            USING (
                SELECT
                * -- specify your specific columns to be used
                FROM @DataToProcess 
            ) s -- s = the source data to be used to update the target table
            -- the join on the column keys is specified below
            ON 
                s.[ExampleColumnKey] = t.[ExampleColumnKey]
                
            WHEN MATCHED -- Handles the update based on INNER JOIN
                AND NOT 
                (
                    t.[ExampleColumnValue] = t.[ExampleColumnValue] -- To ensure only changes are captured
                )
                THEN
                UPDATE SET
                    t.[ExampleColumnValue] = s.[ExampleColumnValue]
            --WHEN NOT MATCHED BY TARGET THEN -- Handles the insert based on LEFT JOIN -- NOT USED IN THIS SIMPLE EXAMPLE
            -- INSERT([ExampleColumnKey],[ExampleColumnValue])
            -- VALUES(s.ExampleColumnKey],s.[ExampleColumnValue])
            
            --WHEN NOT MATCHED BY SOURCE -- Handles the delete based on the RIGHT JOIN -- NOT USED IN THIS SIMPLE EXAMPLE
            -- AND... add restrictions so delete doesn't remove too much. Filter params are normally considered here.
            -- THEN 
            -- DELETE
                
            -- the output captures the changes to the table and logs to a table variable
            OUTPUT 
                isnull(inserted.[ExampleColumnKey],deleted.[ExampleColumnKey])  -- include deleted in case delete is added later. Inserted is used for both Update an Insert
                ,s.[_ExcelRow] 
                ,$action as UpdateTypeCode  -- this logs into an a change log table variable
            INTO @ChangeLog
            (
                [TargetTableKey]
                ,[_ExcelRow]
                ,[UpdateTypeCode]
            ); 
            
            --now we have enough information to update the message to user for each row
            UPDATE dtp
            SET [_MessageToUser] = 
                CASE cl.UpdateTypeCode
                    --WHEN 'INSERT' THEN ', Added!'  -- not used in this example
                    --WHEN 'DELETE' THEN ', Deleted' -- this will never match the excel side but can be used for other types of logging
                    WHEN 'UPDATE' THEN ', Updated!'
                    --ELSE ', No change'  -- not used in this example
                END 
            FROM @DataToProcess dtp
                INNER JOIN @ChangeLog cl  -- use Left Join if 'No Change' is to be identified
                        ON dtp.[_ExcelRow] = cl.[_ExcelRow]
                
        IF @TestMode = 1
        BEGIN
            SELECT '@ChangeLog- Show log of changes made' as ResultName
            select * from @ChangeLog
            
            ROLLBACK TRAN t1 -- note this does not roll back changes to table variables, only real tables
            SELECT 'Changes rolled back since in TEST mode!' as TestModeNote
        END
        ELSE
        BEGIN
            COMMIT TRAN t1
        END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRAN t1
        
        SET @ErrorMessageToUser =  ERROR_MESSAGE()
        GOTO FinalResponseToUser
    END CATCH
    
FinalResponseToUser:
--
-- PROVIDE RESPONSE TO THE SAVE ACTION
--
    
    -- if test mode, show the final table 
    IF @TestMode = 1 
    BEGIN
        SELECT '@DataToProcess - After Validation' as ResultName
        SELECT * FROM @DataToProcess
    END
    
    -- return the recordset results back to the spreadsheet, if needed.
    SELECT
        [_ExcelRow] as [Row] -- this relates to the original row of the spreadsheet the data came from
        ,SUBSTRING([_MessageToUser],3,1000) as [MessageToUser]  -- This is a field that, if it matches a column in the Results Range, will be placed in that column for the specified row
    FROM @DataToProcess
    
    -- if there is an error, raise error and Interject will catch and present to the user.
    -- Note that this is specifically done after the above resultset is returned, since initiating an error before
    -- will not allow a result set to be returned to provide feedback on each row 
    IF @ErrorMessageToUser <> ''
    BEGIN
        -- by adding 'UserNotice:' as a prefix to the message, Interject will not consider it a unhandled error 
        -- and will present the error to the user in a message box.
        SET @ErrorMessageToUser = 'UserNotice:' + @ErrorMessageToUser
        
        RAISERROR (@ErrorMessageToUser,
        18, -- Severity,
        1) -- State)
        RETURN
    END