object RelAbastecimentos: TRelAbastecimentos
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Relat'#243'rio  de Abastecimento'
  ClientHeight = 172
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 167
    Top = 59
    Width = 71
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #224
  end
  object Label1: TLabel
    Left = 16
    Top = 59
    Width = 40
    Height = 13
    Caption = 'Periodo:'
  end
  object Label3: TLabel
    Left = 20
    Top = 113
    Width = 36
    Height = 13
    Caption = 'Bomba:'
  end
  object Label4: TLabel
    Left = 16
    Top = 86
    Width = 40
    Height = 13
    Caption = 'Tanque:'
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 351
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Color = cl3DLight
    ParentBackground = False
    TabOrder = 0
    object Label7: TLabel
      Left = 33
      Top = 0
      Width = 318
      Height = 33
      Align = alClient
      Alignment = taCenter
      Caption = 'Relat'#243'rio  de Abastecimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 271
      ExplicitHeight = 23
    end
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 33
      Height = 33
      Align = alLeft
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
        00180806000000E0773DF8000000097048597300000B1300000B1301009A9C18
        000003C34944415478DA95967B4C537714C74FEFBDBD7D532C63205AC588022A
        A2E1AFC9E22B2C0A6D04A9282AC638BB0579F8628DAE7FCCA09B319A3987607C
        41C498202D10C1079A181F5B8CD128CE99E8966822A0530B0A160BBDED7DEC77
        6F9187ED2DD7F34F7FFD9DDF3D9F9EEF39BF732B0311B3FD58B50827B0121932
        18C37A7ADD84EBCD3B6753FDBE33E82B37D217F2E1B4B4EFE5F905F39F9516AD
        348E159CB77AC755983367DAC0D1E3E72E75BFBEBBCAE9743261010B1614C516
        95E63E3467A57F2905E06CB806792B1683CBD5C3FC56E968AED0F4E44179393B
        06C0F297396B5ECCE70078FBEF553773E8B0A3B94AEF1620A280E2D2DC07A6AC
        F458BF9F86EEB7EF430656AB95A08FD08C02F0D6F9C2451FAA70D41FADB41588
        675092DB6636A58F9792C1A5CBB72135652A4C9830ACE83FFFB653C76A5AECA2
        00CBCA857FA7CD4D8A0E1758A55142E23423503E3F9CBF780B3C1EEF28FFC347
        4FAF840458D6D83323F5BA0B9B37ADC0C2016EFCD106D66F9789FACB7FA9690C
        025856D9B3536727546AB4AA8985D69CB0D2381B03DA73A8F3299F4FD8C3310C
        E4724258EFFEB9BA2908505872A075DD9A254BF94333674C9104A06906DC7DFD
        C29E82948306493704C8C8288ED34747D4A9544A6DE00069ACF8756B58ED3FDA
        C1DFCF8297A284358BB230657E057353A70FF905C0B2BC1D5529B3A614B16CE0
        F2F11F76DB7A29F1E178F53978F73ED0C2189206580C76DA0A02EB8F806C8BAD
        263179D286A1A73819447F619004E8ED75839FF10F6F70186CDF9C0F3A9D7A18
        60CAF9E1C4CC5993AD1FFA69F4330225E18BC6D0818C085C065AB55C1442517E
        61BC2994E80CBAB75B1180BF7C4100B92E1A32CCDF080E37C580D71F188A7F36
        37831AA344831B0C06C0700CCDA16E5091A438401B1507E6FC1CE847813D23B2
        6EAD3D0D24EB1101F82026763C1004062F3A5F8292548803FA061834F930F0D3
        CCA820BC443A352E2E9197122455AA14A125CACA2E3B9398645C2BA9AA631902
        D8CAD686CE60B00DC087746539A911392091EED860738815F924026CE437DADB
        BB00476F48B3E96B49E1EFDF7F02CF3B5F417C7C0CE0380E1C5277DB96D59F48
        B4BCEC48729271137FA0A3A30BA2C6E960FFDE127075F502C330A2C1232335E0
        68B80E77DA1E8306B5289A5DA8B539D83E08E0506176EDA9AE972DC9DE11AF20
        D916855CA1F5780622D025216B8ED9755200A74EB77277EF3DA60942C6D10C0B
        067DC487B889317DA49C60DD6E8FBBBDE3F577C1C3AE78FFC9F25DD68D522472
        365D7FE9AC6B49B879B3D62B762608B0DEBA3B0DC37193A4A6A1194F6DF54F07
        E193BF2A23ED7FC9498F29AB46DC9A0000000049454E44AE426082}
    end
  end
  object dtpInicio: TDateTimePicker
    Left = 62
    Top = 55
    Width = 99
    Height = 21
    Date = 42885.000000000000000000
    Time = 0.590298923620139200
    TabOrder = 2
  end
  object dtpFim: TDateTimePicker
    Left = 244
    Top = 55
    Width = 99
    Height = 21
    Date = 42885.000000000000000000
    Time = 0.590298923620139200
    TabOrder = 3
  end
  object cbxBombas: TComboBox
    Left = 62
    Top = 109
    Width = 281
    Height = 21
    Style = csDropDownList
    TabOrder = 4
  end
  object cbxTanques: TComboBox
    Left = 62
    Top = 82
    Width = 281
    Height = 21
    Style = csDropDownList
    TabOrder = 5
    OnChange = cbxTanquesChange
  end
  object FRRelatorio: TRLReport
    Left = 97
    Top = 303
    Width = 794
    Height = 1123
    DataSource = sRelatorio
    DefaultFilter = FiltroPDF
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object rlCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      Margins.LeftMargin = 2.000000000000000000
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lblTituloRel: TRLLabel
        Left = 85
        Top = 53
        Width = 180
        Height = 16
        Caption = 'Rel'#225'torio de Abastecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFone: TRLLabel
        Left = 87
        Top = 36
        Width = 78
        Height = 14
        Caption = '(11) 2829-4991'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblFantasia: TRLLabel
        Left = 85
        Top = 2
        Width = 70
        Height = 16
        Caption = 'Posto ABC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLImage1: TRLImage
        Left = 10
        Top = 1
        Width = 70
        Height = 70
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000460000
          00460806000000712EE28400000185694343504943432070726F66696C650000
          28917D913D48C3401CC55F5345914A053B8874C8501DC482A888A354B108164A
          5BA15507934BBFA0494392E2E228B8161CFC58AC3AB838EBEAE02A08821F20AE
          2E4E8A2E52E2FF92428B180F8EFBF1EEDEE3EE1D20342A4C35BB260055B38C54
          3C266673AB62CF2B048411C400C62466EA89F462069EE3EB1E3EBEDE457996F7
          B93F47BF923719E01389E7986E58C41BC4339B96CE799F38C44A92427C4E3C6E
          D005891FB92EBBFCC6B9E8B0C033434626354F1C22168B1D2C77302B192AF134
          71445135CA17B22E2B9CB738AB951A6BDD93BF3090D756D25CA719461C4B4820
          0911326A28A3020B515A35524CA4683FE6E11F76FC4972C9E42A8391630155A8
          901C3FF81FFCEED62C4C4DBA498118D0FD62DB1F2340CF2ED0ACDBF6F7B16D37
          4F00FF3370A5B5FDD50630FB497ABDAD458E80E0367071DDD6E43DE07207187A
          D2254372243F4DA15000DECFE89B72C0E02DD0B7E6F6D6DAC7E90390A1AE966F
          80834360B448D9EB1EEFEEEDECEDDF33ADFE7E00932472B45678C2E500000006
          624B474400FF00FF00FFA0BDA793000000097048597300000B1300000B130100
          9A9C180000000774494D4507E7021C0F121E2E3D30500000001974455874436F
          6D6D656E74004372656174656420776974682047494D5057810E170000155049
          44415478DAE55C09781455B6FE6F2DDD9D3D6403590228209B2C82284AE0A930
          E89BE1393A888328A8882CEE82CB88F09041054718DC7DEEBB28EAF3E1320F04
          02228BC82228041216210901C2929074777AA9AA77EED29D84241815489E56BE
          4E57BAAAABEEFDEFB9FFF9CFB9A7C21CDAD0D8B74813A32D553B4CEDDA36A06B
          62DF61FC63A6CEA03DF6CB6EC9EA0F8C136D17ABF2FBD7775AB4A2DA95A31BEF
          703088E0B15294EEDE8BD28202583FEE86FFF02178FD3EFAAA2D5E3AD3E0898F
          833BAD09DC99CD11DBBC39929BB78727A509349749A0D18BCE11975477616A5F
          8BB6E16703E34441E1BFF9683047ABB51FBF0C98C8EDAB3423148677F76EECDD
          B01EA5ABBE8677F50AFA2C447D63D4117A9119381A7F41BCF33EF3638CEF90E5
          D87496651888699D89F89E3D91DAA33732DA768099D11C61D31060680252BA16
          37312782D0CF0526DA765BEDCAABF0C69C046424DCD40CDBE7C5FE8D1BB1E7A3
          8F71ECEB1570F9FC622A683A9F22961808DE79715F8D00600A18DD21B0343968
          1C245DA797019BAEE9680E8144AFF824249DDB074D2FE88FF4AEDDE14E6D2AE6
          9DF87E2D235C3B3011D3B2A9B1E57E146DDB8A233B72A19597819DD11C2D3A9E
          83C4562DC0DCE6AFB29AE88DAD008E6DD98C6D2FBD06EFD2A5302DEA9040C484
          439D06BD189393408042C73443874D2070708425F10EF20BEAFCB0B42670ABA2
          E3B641EF3A84B5D9BA0B566A0BB41A3C042DFA0F424C6A2A7D66D0D758B5AED7
          0E0C6F58451805CB9622EFE37968DE3A1D096D9B0B20ACA35E1CDE958F729688
          AED70C4762F7CEA211DC2459BD994E5AA1E8545939723F5D80FCC7E7C013F421
          CCD4E74C8E3E34490F7C97DF877FCEA712E3534600C3CFD38867F8976C847569
          41DC521821C5084049C27C1A12348C20E02648A08512929071F9D568DD6F205C
          E9D43F03906CCDEA00C61F42EEEBEF22FFA317D1F1CFFD51CE8D9D2E64F3D122
          2B8AA12B3887CBB079C1B7C87AEE29249FDB9DDB6FFD8111C3622158BC0F6B1F
          9B8D8A85FF0BB7232DC0618E24452601718435C8BF6DF1AE897DFEA1A36B518B
          6182731C84382086FC0E5356C3A79F43EDD68977E0A8BFF90934E5F8FDF48434
          B41E711B9A9E7F2191B54B80531318BA40FEA265587FC7589C7D456F222B9D6E
          A2C3D2E44C14E447AFB0A121B0731F0AF6F830E8CDD711DB2A531A633DC1F11F
          388075D3A722B06C390CC7E02627AD83CF0726AFC32DC1212BD0E85D13D6E188
          7DA650B375799ECDF74DB2E6B838B85252893F9AC0E45ECA1DC3BB03DEC540C0
          87A08F2CF2E851D8810A9A15619AA1011808137664699A07895943D065E4CD04
          4E6C55601CF1631F2CC1974387213E70089E6E2DE9A6B61861010A9344C50722
          4C8D8C714C1492D524DF7317FADC7DB7D41282FD6AB7123EBAE42F10205056FF
          6D0AEC75ABA1DB8A7C3991EA72EAC8E923095ED3356109C2C8F808D3BECE641B
          42447176B3D66876C96548EFD20B492D3361A62403DC45578A9AEA1B79BCF031
          1F7C65C750515280B2825DF0E6EF44F196EFE169DA067DEE9B06D39350098C30
          5F278CC265AB9073CD2824B66902A7453C996F58909A98E38C453500E78218C7
          83D2EFF620109B82014B3FA3914A8198A8B50163CB763AFE32AC9FFB24BCEFCE
          A7D38274615B32A6B002C50D7AC42A24A748125516C45F2E0D46C7CE68FBEF57
          0BF3D713E3E9B851CB5466B5B683FB5647934A860F94630761957BE96C9DA655
          8AE4B7083061DE3C0266DB2BAFA3E8FE87C1523CD0533D64AE6132753545F83C
          877CE70D8D25604A76EF8775B00259B9AB11D7A62D9D68D44D2C84C3D6791FA0
          60F634B8F89CA78F0C02236498D2621430DC4A8456897089BA37E7142BA3253A
          8D9F808CDEE781C5C611586615D5A6D50B18A87B457D9023EFC52503631C09B3
          3A3006E994EF9F7D1E47A7CD826532B86339B7A82B2930A2BA91F6753AE42B29
          83E375D077DD7224746C2F48B876584238B46903368C1E0757D84FDF95562066
          8C206E08D7CC4753E7C0D0014B93F7D4B9667119705D3C18DDAFBF059E162D14
          085524ABD8B5A5EBFA559B539D7C23CAFCFB575F45F17DFF496DA51B1AB6245B
          4717CC221B2A4782774123C9EE9022F57A43B878DB06C466B6445DC2C6AEF061
          D5E4FB1058922DBE2DAC5063CA2DABE9C2B94487F230828905308EDB8D662346
          A3C35FAEA2F99B48A7D661958E53E7FD7FD6C6AAEA18458E8756ACC0862B86C3
          E4A4A75B64EE048AA3470745580E5916373BCDB285B40E776A87AC051FC3E01C
          53A3618E7095FB966763EBC48930C913284521B8447A2208AFE4D06070310641
          D274068D4220DE8D36B74FC29917FF9106CA54A2BB76ABC4C90A878F07C6E2BF
          BC15F86ACC6DB0162DA19109094222F9245C5E94DCC4572C21EAC8E9217DE634
          74B961B8F006AC862720395E528AECDB2640DBBA896B4F29B2B81E3114D09A72
          7B3A8B5A119F5E7E9204991326A2E39FC85274A3B2D57559C5A900A63294B370
          64FD467C3B621CDC870E28F75C1D18BEAF13F758167D3E388B44DE6CE84D52A3
          8DAEDA6C3EE50AB39722E79E4930F490BCAF8A77989A3611705844A308A3D091
          36FC46B4BFFE060230465DF327F8E394580C2254660BF153B87829B64F7C0838
          504CD3A96683829A05D745E7A3F79C47109349E28E62905A810987B166F28308
          2EFE82C8BE326C70441CA82C8403C28953C53662307A67A1CFE4294042B29A78
          3809C4FAAB8081982A0E116BF9F67C6C7DEF3D14CF9B0FEDD061E13A39111B3D
          DBE18C1123D161C8E530D3937122C20B14EE47F6B03F23265C2E1D09931E4DE0
          C3A36025F785AEE01134F782894DD175FA5C2475E804E9B6A2A15DC30053758B
          E68F68C4FDFB0E205C58049FD78FF89414B85A3785D92489269D2E5C699DED25
          D2DDB36811F21EFE1B5C4E50E9384D81C084E7136A3AA253E8651195648CBA15
          675F3D522256DF9E44DE9D93ED956A01C652B7D4451AC082253CB82643791E83
          59ACB2F1B5B5276C63E3CCC770EC8BF7C1D3478EC1A24A1691E08F45A612133A
          C6C96C87BE339F87169F2CD20DD5DBC4AAB4AE6A3FAA585384FC7F0DDF9C0898
          1A283115AF1C97B7385E39544D52864A4BB0F2E65130F6EDA4F612511B8AC035
          4765DEB44A1DA3AC26F5D24148E93790AC291ECC45D396B8CBA4E090C5C4C1A4
          C8573768FAB95D8A9B0C21EA3591CAE3710BF7AB32D862A705985FB0F1CBFA77
          E660D9C86148E219388AD06D3D028223A3695D02A3A9805180CE653F9D67710B
          824A4071574DA068F1893093D38890297A4E4F4372666B24659E85A4F496D012
          53649E8529AB510AB6E181514EDFA9A840C9BE42946EDF82E2154B50BE269B54
          6E24005479139E40D2516931FC0F4D26B66D3E9D94CEE1BA462698A445D9A46B
          340249AC02309957B1353742EE3824B5EB84265DBA219982CBA466A4C0B51845
          DCAAA7A71A9808F7E8910121F56BFBFC38BC6B278E6E5C87FD5F2D41B07007F4
          6005B5CB9126AF521552BF4090AEA3D20BD24E5CD4694B2477C3B6B424986EB0
          B804E8EE18D231264D2197C8C6F1B36DCB125ED3F6F9C04241195F19224B043B
          C624057E06322E1A8CCCAC4BE95A1119515B67EA70FFBFDC62B84C0E217CE408
          F6AC5889C22F3F47C5E6F58811A66F8BC053E453F4CA6473241D194D590A6435
          31AD6C66C24A6F8696FF712DE29BA4C39D9608169F00C315471E9D7B3E5D893F
          43708915B6601330616A83ED2F8753E6A760B614DEE2021CDB9383F2FD7B6036
          6B87F3C7DE099B035B97303C69C0D8F25779FE2E14AE5C891FDF790B1ED23706
          EF1FFD0A730DC264E25AA40D74990E8DE669C5D4814C588BEC9B21AE17A67312
          075E896EB74C1266C4337532215DC5E3D5E66DAA04D651D227B09C8A7201BA46
          846DABB8EB940063F3F886CE0A1D3A825D0B3EC5FEF7DF825D7E10922B99CAB9
          229A9284B0104D681279CC11D1B2A62C068A37C4319E90A0735BDD3115AD2E1C
          8CAAEEA4FEC9F5136D5675144F1A30DC4AC8740FAEFD0639CF3F0D6D478EE8BB
          CD9C68C0C73D87AECB2CBDCD5DA6580BF2501048CE44A42AEC2AE905050EA437
          E2517A883EEF3EE339C4B5E92223EE930A4C557B3A59C0F046138F6C7AF36D94
          BDFF364C2237A6C41D94628D4C0D953EA16941EF67B647DBA143B1E3C30FA1ED
          DF2DF2C65AF47C2D2A0A35115E935B27BEE9FFF407148866701A3DC9C04446F7
          24002330E6A014E5E3DB7F3C86D09A5530B8338D44C5AC3293E888751C9D3305
          1CD212CD868FC19903FF0023CE44F603F7C0DCBD29DAC908288C45B277D26A2A
          92D2D1EF8937A0B962542EF66403F3F3B75A81B11D1BC7F2F760DDD48760E6FE
          2073A12A26125CC1442242006ED10007DC3A52070C46C7A1D7C3DD2A93A69149
          A613C0F28726C2D8B541C96325E4AA0023340D77D61DBAE1DC07FE415CECAE16
          EA342260A4C00F14E663D59407616CFD8EA60D5F17D6AB00C344750117693CD5
          C9D79D5A8C188BF6575D03CD134FC72D910AE42B00AB664D85B57EB9E4125402
          8348082016CC3424F6BA089DC73D487F7BA2051C8D0618190E51677D5EAC7964
          1A425F2D14815F355E6095D1305F23F3520CD3F9DE6968715E7F996113FD50EB
          2404DC86979F46C5A20F944A55F2BE4A3E57ECD38512060C41E791E3E823A3F1
          598C288AA0C1DEFEC9872878F231984E289A0E8844C14E24B144E7072876E970
          FF74B4BC70A02C47601182ABCC9DE4FDCF3C1C98F78C987A95D7512C1DB51C17
          92065E838E575F274283A874694050AA01C3175082070FE1EB3BC65134BC4B74
          5053822CB2866C8938472ADAD6E31F429BC143242822677B3C5531EC5FBD18B9
          CF4DA7D375715C6772BD4815B4080DA4057478060E43A76BAF1789ABD3958BAA
          3F3021073B3F9F8FA2393379DE5F5A865E098C586CE3A28D3E4F1A74057A8C27
          954A5E4449D4CA25842A5BD9B6EFB071E644786C0B019A6926B1352FDB719BB1
          08960651BE673F82F9879136650A7ADE72B38C911AC956090C057DABEF180F6B
          1B77AF7674FD58D08B5A22E5BD0F2624A1C78C39486C7F8E584138D15651BC0F
          DF4C190777D00F5333E10AD8F01FF3C25F7814FE1F2994907517489B3E05DDC7
          8EAE26EE1A7A8B021328CEC78A1B46208E823229E09C68B62DA25D1CF24031C4
          293DEE994C53CB23F9E2049BE32DC7F7B3A7209CBB0D1507CB712C6F0F746F48
          710E599F2352EF489FFC007ADD36AE715ACC919DB9D87CEB8D880DFB84447722
          850B5573B2A61B99131F41CBBEFD6B5927AE0D191B5B9E9A83BDB39F84CB2703
          4D5EFEA5A9EA064BB600C977DD89DE93EE020CFDA7AF79BA8139BC330F9B6E1F
          8D58AB4CC8FA489208AC12A090E6C60573DF82ABC599F52249BE62B9E7CB45D8
          366A023C3C6FA3083AE27144451F79B3A491D7A1F723D38984CC86C6A3263081
          03FBF1D5D811F0848E46DDB3D8B44A77ED370C64BDFC09CCD8F47A66F01D04F6
          156179DF417057F8C842EC1A6ED8268DE0FED365B8E8F967C14C5743E3511318
          84435875EFAD70F23689356B916EE4823DAA3F884C8903FA3E3F1F464A73E84E
          7DD679286C0884B0E2CAA1086EF8AED63A3D1E7EB09EDD70F1828F6592BB916C
          D542821DFF5A80FC171F85E158226B56A965E4940AD09CEAF4D01CA475E9A588
          F7A781015D6BF32BAF61FF43334485C3F1C07061E94F4AC1E51BD6408BF73434
          1EB5006393D91F3D80D5D3EE82BEEFC728418AC5779E74A6E36EC70DF725578A
          C21DC66AAF8FAD7987308E6CC9C5374386C1555E26337BC741EA77740CDEB816
          7AF3945F9ED93F65C088D1755090FD1976BEF80462AC2091B00E178BA3A02808
          5FF16104F71D45B8795BF4FF701E625AB6A81E05D4E1A42C3A49F785F1AF3113
          602E5E24ABCAB914885A8F8630EDF7A3D82CE6EC768D0F1887D7815140E7047D
          F8E18D97E1FDF253842A2A601579112828862CF7E38D3690FEE024741F7F0BED
          9E9813C48A2564C450F0F9426CBF7182C8E46B0E5375B84C2C9085C9223BCF7F
          132DFBF56D5CC0441E9F10DA9697C507FC58FDC45C943EF92A718C2516DB457D
          ADC384330A9871E8FAE20B683528EBC4DE8955E6CEAC0347B16CE85F61E46C15
          E03A9AAD808190016D1E9F8EF62386C90A8846B0D54C54A9722DEB5809D6BDF0
          028AE73E03B7CD60D886147DFC1CFA3B989286735E988D33065C14FD9C9DA87E
          256C63D3534FA368D63F61DA8E5A67928B6F41022665F4289CF7F064A09168BC
          3A72BEB678F1FABAC2EC15D83C751ACCDDF9E4A25575A52D8BC52A5212D0EED1
          BFA3DDE57F00627EE2B902B2C4D2BC5C645F762512CBFDAA4252026331137ABF
          3E18F0DA4BD012E21A1A93130113A93E6362A5D1BB772FB6BDFC268EBCF7114C
          8A7FB85531C716959E21E646EAF81BD173EC0D309B66205A00CD6AB9A61DC29A
          99B351F6D47F890729102959A5937D7126062C5D8CF836990D8DC98980A98111
          118B85926D3F60E7270B70E8E5776086826241CCB62DE208B2B04EEDD166C238
          9C75E925309B24AB809055BB0EB70E6FDE0E640F1D81C4C203B044FEC5924588
          E405BBCD7B07675C7AB1CAD2A35E6147C3015375E3EBC534EADE5DBBB1FBD385
          285ABC04CEDA4D3055241ED64D84BA9D8D766346A16DFF2CB8D29AD688989D50
          001B9F7C0E25B39E1535FC96C6ED4E9671A4DC31013D1E98242BADFE5F0183CA
          DC30FF1A7F60A13C2F0F8776ECC0AECFBE4070DDF788F1FA859FF6766883F39F
          F9279A75EB5AEDDB3C70ACD8B5175F0D190ECFC122F5C4893CEA3BAB35FEF8DF
          F3818C0C5126DB90C8FCFC457D75B6A5548DACBB27971E0822547400870B8A70
          E8875C94F8CBD1EBDAAB11D32CA3E62588B772DE7E1F050F4C05E38FF4A9CA29
          CBD0D0FDE3F9483BBF779D85F78D1798FA6CB62C7AE6F997BAC00D1F2EC6E29B
          48F0AD5A4FDA25ACEA6080B4197F47D79BAE13EBDCBF29606AA6C46B6E224145
          B72D5EB3061BAEBA0E2E3B1C7D16CAEE760EFE6DFEBBD093137E7BC044C0883E
          BE5B1B30FC18B9FE15B3E620F8C21BA4AA2D5100594117E845C0341BD0AF41C3
          8353568377A22D5ACB42B70EE617E1CBBF5E070F113897D0BC32DD45DC94F5F8
          0C3077ECEF0B980832E2C12E1ED12F5C882D37DD4AA2CFA2D0C342202E017D16
          BC8F2634ADD040DEA9110063893ABAB5931F43D9EB6F41E7B90C6620EECE31E8
          73EFBDA2CCBE3248FBAD03530D24F9D46C456111BE1E7E13B4DC3CB828DCA848
          4A42DFCF3E424287B662F5F374DB4C2300C6163919C69F69FAF61B6CF8CB28C4
          5A7E5161113B66347A3F783F6C8F01E33443D32880E153C51635D141E4BCF606
          F2A7CE10C004830CBD3E7B8F045F4F9A626665D5D86990380D0F4C041F47A63B
          C3C74AF0CDF447E17BF723E861B2A6FEE721EBA56761A466884C606D4F0CFFA6
          8151F088A77443C507B1F2F6FBE02CC916E5A82D1E99818E378C8066B0D3A66D
          1A15308EFA772C3C8B7134770756DC3601C99B72E18F4F458F57E7A2E9800B28
          E8749D8E99D4B880A90612E99992BCED5879D3787876E623D0B625B2DE7E1109
          679E7D5A8A8A1A2D30F25F2C113839395875F744B873F2600C1F86AC598F469F
          56F97D0213F9873B569834CE3EAC7DE51D2475EA80EE43AF048CDF35300A1E47
          FEFB27BE2A676B4EF5828353B8FD1FA9F817B6A171E5650000000049454E44AE
          426082}
      end
      object lblEnderecoCompleto: TRLLabel
        Left = 87
        Top = 20
        Width = 401
        Height = 14
        Caption = 
          'Rua Josefina Leonora Lotto Bueno, 715 - Montanh'#227'o - S'#227'o Bernardo' +
          ' do Campo/SP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 16
      BandType = btColumnHeader
      object RLLabel1: TRLLabel
        Left = 10
        Top = 0
        Width = 33
        Height = 16
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 115
        Top = 0
        Width = 52
        Height = 16
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 266
        Top = 0
        Width = 49
        Height = 16
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 673
        Top = 0
        Width = 38
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 129
      Width = 718
      Height = 16
      GreenBarPrint = True
      object RLDBText1: TRLDBText
        Left = 10
        Top = 0
        Width = 99
        Height = 16
        AutoSize = False
        DataField = 'DT_ABASTECIMENTO'
        DataSource = sRelatorio
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 115
        Top = 0
        Width = 76
        Height = 16
        DataField = 'ID_TANQUE'
        DataSource = sRelatorio
        Text = ''
        BeforePrint = RLDBText2BeforePrint
      end
      object RLDBText3: TRLDBText
        Left = 266
        Top = 0
        Width = 71
        Height = 16
        DataField = 'ID_BOMBA'
        DataSource = sRelatorio
        Text = ''
        BeforePrint = RLDBText3BeforePrint
      end
      object RLDBText4: TRLDBText
        Left = 592
        Top = 0
        Width = 119
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VL_ABASTECIMENTO'
        DataSource = sRelatorio
        DisplayMask = '#,###,##0.00'
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 145
      Width = 718
      Height = 16
      BandType = btSummary
      object RLLabel5: TRLLabel
        Left = 546
        Top = 0
        Width = 40
        Height = 16
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult1: TRLDBResult
        Left = 592
        Top = 0
        Width = 119
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataFormula = 'VL_ABASTECIMENTO'
        DataSource = sRelatorio
        DisplayMask = '#,###,##0.00'
        Info = riSum
        Text = ''
        OnCompute = RLDBResult1Compute
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 161
      Width = 718
      Height = 16
      BandType = btFooter
      object lblUlt: TRLSystemInfo
        AlignWithMargins = True
        Left = 708
        Top = 0
        Width = 10
        Height = 16
        Align = faRight
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Info = itLastPageNumber
        ParentFont = False
        Text = ''
      end
      object RLLabel6: TRLLabel
        AlignWithMargins = True
        Left = 698
        Top = 0
        Width = 10
        Height = 16
        Align = faRight
        Alignment = taCenter
        AutoSize = False
        Caption = '/'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
      end
      object lblNum: TRLSystemInfo
        AlignWithMargins = True
        Left = 688
        Top = 0
        Width = 10
        Height = 16
        Align = faRight
        Alignment = taCenter
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 2
        Top = 0
        Width = 29
        Height = 15
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Info = itNow
        ParentFont = False
        Text = ''
        BeforePrint = RLSystemInfo1BeforePrint
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 140
    Width = 351
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    Color = cl3DLight
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 155
    object imgSalvar: TImage
      Left = 319
      Top = 0
      Width = 32
      Height = 32
      Cursor = crHandPoint
      Hint = 'Salvar'
      Align = alRight
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF4000000097048597300000B1300000B1301009A9C18
        000002F44944415478DAD5975B4814511880FF7FD6F556B2BBA6C85A69AB9810
        4450C48624A5D8631444AF410FA52F6605D643590F629037B028DB42BBF824F9
        103D65813EF42218EE83F5A0E02DC4CB0A5EB2DC7577E6FCFD33EBA58BE6CC3A
        ABF4C3D93367CECCF9BE739B9D41D8E6C0FF46E02E919409902D0138850C0E24
        98B45861F002A22FAA022F89F6A3806B02E00C179DC43F44E124084808E8E1C3
        D6F938785C8EF8C3348106A23807400D08282104AB06FD05AE1E335C95D09242
        30CEA7CA4A13F1F5A6059A88526301DE30286F05FA0FF88A84D0AAABAE276145
        C4021E226B22C0076EE98411F86F2204376EDAB026228116221E7DB812295C13
        50D4C180825BC9F8D190C0D282FBAC67CED74D429B0A7514BAEFEC023720926E
        81570A3532BCC404B8960B050A2B9DD8A94B40DDE72E01A3F0C7568B181E9E8A
        867BE97855974033518E24A0DF3438E7B2006FF56E3CAC4BE045880A48820EB3
        E04BC957BB17D3F48D40884E73E9AD69F070FD627D06C6EB12680A12AF58E832
        110E32C1F0834C74E912784694062118E7114033E06A2E2BD0F9280B0B756F43
        4F803EF17D47CC802F95CB1BB3B056B7C09300957383D566C07907C828436E63
        2E0EEA16A8234A88F3433F37BC67533D0F27CFD31C2C810DE2AFFF82870B749E
        E7AE95DBC248E10BFE406862F6FBC1F6E3A97D8605D4A89FA74A86DC8E041E0C
        29D0EDFD026287DDBB33C556D495679F362CA0C6FD392AE367791D032D467ADE
        D3DB6715F14990989CC2AF4BD431353C736EE4A26BD6B0801A55D394CFCFF31A
        86B8375A707C5DF3D8D854EDC8B78596049BC3CDB7CF4D7D9D1F0BF8452006A1
        68F452C6B461012D88B062024EF243E52C03F3199CCEB983852678AD0C70F91D
        28D0B6BCDA0F75CED8AD28B531DC195C1407C24D80773D89A8BC963B3C03B678
        29A69D9B77AFF6636D89A87D17E89588EA8749E6F3217B5096DE33E6E8EA59EA
        0E08F9D44C71F65CD405D696209F203A367979DFD09608A8B13A1DE0520416F9
        8A337A97EBB6ECDB509588454BF272CFB75C60BDD876819FB6C0804ED06A5B0D
        0000000049454E44AE426082}
      Proportional = True
      ShowHint = True
      Stretch = True
      OnClick = imgSalvarClick
      ExplicitLeft = 248
      ExplicitHeight = 48
    end
  end
  object mtRelatorio: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 176
    Top = 88
  end
  object sRelatorio: TDataSource
    DataSet = mtRelatorio
    Left = 256
    Top = 88
  end
  object FiltroPDF: TRLPDFFilter
    DocumentInfo.Title = 'Rel'#225'torio de Abastecimento'
    DocumentInfo.Author = 'Alan Bariani'
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    FileName = 'Abastecimentos.pdf'
    DisplayName = 'Documento PDF'
    Left = 104
    Top = 104
  end
  object FiltroXLSX: TRLXLSXFilter
    Options = [xfoFindValueCells]
    FileName = 'Abastecimentos.xlsx'
    DisplayName = 'Planilha Excel'
    Left = 144
    Top = 88
  end
end
