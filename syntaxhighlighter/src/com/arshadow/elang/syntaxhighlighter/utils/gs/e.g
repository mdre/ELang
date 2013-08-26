// Definición del lenguage basada en e.g, elex.g y quasi.g
grammar e;

options {
    output=AST;
    k = 2;                            // number of token lookahead
    language=Java;
}


// definition of tokens
/*
TOKEN:keyword:(
"abstract" | "accum" | "an" | "as" | "assert" | "attribute" |
"be" | "begin" | "behalf" | "belief" | "believe" | "believes" | "bind" | "break" |
"case" | "catch" | "class" | "const" | "constructor" | "continue" |
"datatype" | "declare" | "def" | "default" | "define" | "defmacro" | "delegate" |
   "delicate" | "deprecated" | "dispatch" | "do" |
"else" | "encapsulate" | "encapsulated" | "encapsulates" | "end" | 
   "ensure" | "enum" | "eventual" | "eventually" | "export" | "extends" | "escape" |
   "exit" | "extends" |
"facet" | "finally" | "fn" | "for" | "forall" | "fun" | "function" | 
"given" | "guards" | "hidden" | "hides" | 
"if" | "implements" | "in" | "inline" | "into" | "interface" | "is" |
"know" | "knows" | "lambda" | "let" | 
"match" |  "meta" | "method" | "methods" | "module" | 
"namespace" | "native" | "obeys" | "on" | "obeys" | "octet" | "oneway" | "operator" |
"package" | "pragma" | "private" | "println" | "protected" | "public" | 
"raises" | "reliance" | "reliant" | "relies" | "rely" | "require" | 
   "return" | "r eveal" |
"sake" | "static" | "select" | "signed" | "static" | "struct" | "suchthat" | 
   "supports" | "suspect" | "suspects" | "switch" | "synchronized" | 
"this" | "throws" | "thunk" | "to" | "transient" | "truncatable" | "try" | "typedef" |
"unsigned" | "unum" | "uses" | "using" | "utf8" | "utf16" | "var" | "via" |
"virtual" | "void" | "volatile" | 
"when" | "while" | "wstring" | "_"
)
*/




tokens {
  BIND='bind';
  BREAK='break';
  CATCH= 'catch';
  CONTINUE= 'continue';
  DEF= 'def';
  ELSE='else';
  ESCAPE='escape';
  EXIT='exit';
  EXTENDS='extends';
  FINALLY='finally';
    FN='fn';
  FOR='for';
  GUARDS='guards';
  IF='if';
  IMPLEMENTS='implements';
  IN='in';
  INTERFACE='interface';
  MATCH='match';
  META='meta';
  METHOD='method';
  PRAGMA='pragma';
  RETURN='return';
  SWITCH='switch';
  TO='to';
  TRY='try';
  VAR='var';
  VIA='via';
  WHEN='when';
  WHILE='while';
  UNDERSCORE='_';

  ABSTRACT='abstract';
  AN='an';
  AS='as';
  ASSERT='assert';
  ATTRIBUTE='attribute';
  BE='be';
  BEGIN='begin';
  BEHALF='behalf';
  BELIEF='belief';
  BELIEVE='believe';
  BELIEVES='believes';
  CASE='case';
  CLASS='class';
  CONST='const';
  CONSTRUCTOR='constructor';
  DATATYPE='datatype';
  DECLARE='declare';
  DEFAULT='default';
  DEFINE='define';
  DEFMACRO='defmacro';
  DELICATE='delicate';
  DEPRECATED='deprecated';
  DISPATCH='dispatch';
  DO='do';
  ENCAPSULATE='encapsulate';
  ENCAPSULATED='encapsulated';
  ENCAPSULATES='encapsulates';
  END='end';
  ENSURE='ensure';
  ENUM='enum';
  EVENTUAL='eventual';
  EVENTUALLY='eventually';
  EXPORT='export';
  FACET='facet';
  FORALL='forall';
  FUN='fun';
  FUNCTION='function';
  GIVEN='given';
  HIDDEN='hidden';
  HIDES='hides';
  INLINE='inline';
  INTO='into';
  KNOW='know';
  KNOWS='knows';
  LAMBDA='lambda';
  LET='let';
  METHODS='methods';
  NAMESPACE='namespace';
  NATIVE='native';
  OBEYS='obeys';
  OCTET='octet';
  ONEWAY='oneway';
  OPERATOR='operator';
  PACKAGE='package';
  PRIVATE='private';
  PROTECTED='protected';
  PUBLIC='public';
  RAISES='raises';
  RELIANCE='reliance';
  RELIANT='reliant';
  RELIES='relies';
  RELY='rely';
  REVEAL='reveal';
  SAKE='sake';
  SIGNED='signed';
  STATIC='static';
  STRUCT='struct';
  SUCHTHAT='suchthat';
  SUPPORTS='supports';
  SUSPECT='suspect';
  SUSPECTS='suspects';
  SYNCHRONIZED='synchronized';
  THIS='this';
  TRANSIENT='transient';
  TRUNCATABLE='truncatable';
  TYPEDEF='typedef';
  UNSIGNED='unsigned';
  UNUM='unum';
  USES='uses';
  USING='using';
  UTF8='utf8';
  UTF16='utf16';
  VIRTUAL='virtual';
  VOLATILE='volatile';
  WSTRING='wstring';


  OpLAnd='&&';
  OpLOr='||';
  OpSame='==';
  OpNSame='!=';
  OpButNot='&!';
  OpLeq='<=';
  OpABA='<=>';
  OpGeq='>=';
  OpThru='..';
  OpTill='..!';
  OpAsl='<<';
  OpAsr='>>';
  OpFlrDiv='//';
  OpMod='%%';
  OpPow='**';
  OpAss=':=';
  OpAssAdd='+=';
  OpAssAnd='&=';
  OpAssAprxDiv='/=';
  OpAssFlrDiv='//=';
  OpAssAsl='<<=';
  OpAssAsr='>>=';
  OpAssRemdr='%='; 
  OpAssMod='%%=';
  OpAssMul='*=';
  OpAssOr='|=';
  OpAssPow='**=';
  OpAssSub='-=';
  OpAssXor='^=';

  //OTHER funky tokens
  Send='<-';
  OpWhen='->';
  MapsTo='=>';
  MatchBind='=~';
  MisMatch='!~';
  OpScope='::';

  DollarOpen='${';       //#/* "${" */
  AtOpen='@{';           //#/* "@{" */
  
  FLOAT64;
  HEX;
}



WS: (' '|'\t')+ { $channel=HIDDEN; };


//#I don't know if this is right
EOL: '\r'('\n')*
   |'\n' { $channel=HIDDEN; };


//#TOKEN:LiteralString:( '"' [^ '"']* '"' )    #/* Double quoted */
//#TOKEN:LiteralTwine:( '`' [^ '`']* '`' )    #/* Double quoted */

IDENT: (('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')* );               //#/* like Java's ident, but no "$"s, and not keyword */
//#TOKEN:VerbAssign:('=')       #/* ID "=" */

/*
//"<" protocol ":" body ">"
URI:('<' (^ '-') (^ ('<'|'>'|':'))+ ('>' | ':' (^ ('>'|':'))+  '>'));              


URI:('<' (('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*)
            ( '>' |
             (':' 
                ('a'..'z'|'A'..'Z'|'_'|'0'..'9'|
                 ';'|'/'|'?'|':'|'@'|'&'|'='|'+'|'$'|','|'-'|
                 '.'|'!'|'~'|'*'|'\''|'('|')'|'%'|'\\'|'|'|'#'
                )+
             ) '>'
            )
          )
TOKEN:URI:(('a'-'z'|'A'-'Z'|'_'|'0'-'9'|
                ';'|'/'|'?'|':'|'@'|'&'|'='|'+'|'$'|','|'-'|
                '.'|'!'|'~'|'*'|'\''|'('|')'|'%'|'\\'|'|'|'#')+
          )
*/

//--------- sacado de elex.g


fragment
URIBody:            (  'a'..'z'|'A'..'Z'|'_'|'0'..'9'
                |';'|'/'|'?'|':'|'@'|'&'|'='|'+'|'$'|','|'-'
                |'.'|'!'|'~'|'*'|'\''|'('|')'|'%'|'\\'|'|'|'#'  )+
            ;
URI:                  ('<'  IDENT ('>' | ':')) =>
                      '<' IDENT ( '>' //{$setType(URIGetter);}
                                 | ':' (    (ANYWS)=> (LINESEP)* //{$setType(URIStart);}
                                       |   URIBody '>'  ))  //{$setType(URI);}
                |    '<' (LINESEP)* ;


//protected
ANYWS:      ' '|'\t'|'\f'|'\r'|'\n' ;
//--------------------------

//#TOKEN:OpLt:('<')
//#TOKEN:OpGt:('>')


//#dollarIdent=('$' <IDENT>);      #/* "$" ID */  
//#atIdent=('@' (<IDENT>|'_'));          #/* ("@" ID) | "@_" */
//DollarOpen:('${')       #/* "${" */
//AtOpen:('@{')           #/* "@{" */

//DocComment:
//    ('/**' - '*/') { $channel=HIDDEN; };

DOC_COMMENT
    :    '/**'
        //(    //    '\r' '\n' can be matched in one alternative or by matching
            //    '\r' in one iteration and '\n' in another.  I am trying to
            //    handle any flavor of newline that comes in, but the language
            //    that allows both "\r\n" and "\r" and "\n" to all be valid
            //    newline is ambiguous.  Consequently, the resulting grammar
            //    must be ambiguous.  I'm shutting this warning off.
            //{ LA(2)!='/' }? '*'
//        |   EOL
//        |   ~('*'|'\n'|'\r')
        //)*
        .* 
        
        '*/'
        //BR
        //{$setText("**comment hidden**");}
        {$channel=HIDDEN;}
    ;



//comment:( '/*' - '*/' ) { $channel=HIDDEN; };

Line_comment: '#' (~('\n'|'\r'))*  {$channel=HIDDEN;} ;

//#TOKEN:LiteralChar:(.?)      #/* Unicode */
//Operator:( '(' | ')' | '[' | ']' | '{' | '}' | '.' | ':' | ';' | '+' | '-' |
//                 '<' | '>' | '!' | '~' | '?' | ',' | '|' | '_' | '=' | '$' | '@' | 
//                 '*' | '/' );
//#'<' | '>' | 

//#####################
//# Syntax definition #
//#####################

/*
# Comments and whitespaces should be ignored
SKIP:comment
SKIP:line_comment
SKIP:linesep
SKIP:EOL
SKIP:whitespace
#SKIP:LiteralChar
*/

//########################################################
//# symbol definitions - from elex.g

// hexadecimal digit
fragment
HEX_DIGIT   :    ('0'..'9'|'A'..'F'|'a'..'f')  ;

fragment
OCTAL	:	('0' ('0'..'9')) => ('0'..'7')+ ; // { $setType(OCTAL); };

// an integer
fragment 
POSINT:         ('0'..'9') ('0'..'9')* ;

fragment
FLOAT64     :   POSINT ('.' POSINT | ('e' | 'E') EXPONENT)  ;

fragment
EXPONENT:       ('+'|'-')? POSINT  ;




//// a numeric literal
//int:            ('0x') => '0x' (HEX_DIGIT)+  //{ $setType(HEX); }
//            |   OCTAL
//            |   (FLOAT64) => FLOAT64  //{ $setType(FLOAT64); }
//            |   POSINT
//            ;

/*
#TOKEN:INT_1:('0'-'7')
#octal='0' (<INT_1>)+;

#// an integer

#TOKEN:POSINT:(('0'-'9') ('0'-'9'|'_')*)
#float64 =   <POSINT> ('.' <POSINT> | ('e' | 'E') exponent)  ;
#exponent=       ['+'|'-'] <POSINT>  ;
*/


/*
#######################################################

#TOKEN:NotCharLiterals:([^ '\'' '\n' '\r' '\\'])
#char_literal    =    '\'' ( esc | <NotCharLiterals> ) '\''   
#FIXME: deben agregarse los caracteres que deben ingnorarse
*/
CHAR_LITERAL    :    '\'' ( ESC | ~('\''|'\n'|'\r'|'\\') ) '\''   ;        
//
LINESEP: (EOL)+ { $channel=HIDDEN; };
//
////#// string literals
LiteralString: '"' (   ESC
            |   EOL
            |    ~('"'|'\\'|'\n'|'\r')
        )* '"'  ;
//
fragment
ESC:    '\\'
        (    'n'
        |    'r'
        |    't'
        |    'b'
        |    'f'
        |    '"'
        |    '\''
        |    '@'
        |    '$'
        |    '`'
        |    '\\'
        |    ('u')+ HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
        |    '0'..'3'
            ('0'..'7'
                ('0'..'7')?
            )?
        |    '4'..'7'
            ('0'..'7')?
        )
;

//########################################################

////########## Datos obtenidos del archivo quasi.g
////#TOKEN:QuasiOpen:('`' [^ '`']*):<IN_QUASISTRING>         #/* ("`" char*) | (char*), up to hole */
//
//QUASIBODY:      '${'            //{$setType(DOLLARCURLY); selector.push("e");}
//            |   '$' IDENTQ     // {$setType(DOLLARHOLE);}
//            |   '@{'            //{$setType(ATCURLY); selector.push("e");}
//            |   '@' IDENTQ      //{$setType(ATHOLE);}
//            |   '$$' QUASIn
//            |   '$\\' QUASIn
//            |   '@@' QUASIn
//            |   '@\\' QUASIn
//            |   QUASI1 QUASIn
//            |   ('``')=> '``' QUASIn  //lookahead is needed to not conflict
//            |   '`' //{$setType(QUASICLOSE);} {selector.pop();}
//            ;

//QUASIBODY:      ('${'|'@{')            //{$setType(DOLLARCURLY); selector.push("e");}
//            |   ('$'|'@') IDENT     // {$setType(DOLLARHOLE);}
//            |   QUASIn QUASIn
//            |   ('``')=> '``' QUASIn  //lookahead is needed to not conflict
//            |   '`' //{$setType(QUASICLOSE);} {selector.pop();}
//            ;
fragment
QUASIBODY: ~('"'|'\\'|'\n'|'\r');

fragment
QUASIn:     ( QUASI1 | '$$' | '$\\' | '@@' | '@\\' | ('``') => '``')* ;

/*
QUASI1:         ~('`'|'$'|'@'|'\r'|'\n')
            |   (options {generateAmbigWarnings=false;} :
                    '\r\n' | '\r' | '\n')   {newline();}
            ;
*/

fragment
QUASI1:         ~('`'|'$'|'@'|'\r'|'\n')
            |   ('\r\n' | '\r' | '\n')
            ;

//fragment
//IDENTQ:      ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*  ;

////# -----------------------------------------------------------------------------------------

reserverd:(
        'abstract' | 'an' | 'as' | 'assert' | 'attribute'
 |      'be' | 'begin' | 'behalf' | 'belief' | 'believe' | 'believes'
 |      'case' | 'class' | 'const' | 'constructor'
 |      'datatype' | 'declare' | 'default' | 'define' | 'defmacro'
 |      'delicate' | 'deprecated' | 'dispatch' | 'do'
 |      'encapsulate' | 'encapsulated' | 'encapsulates'
 |      'end' | 'ensure' | 'enum' | 'eventual' | 'eventually'
 |      'export' | 'facet' | 'forall' | 'fun' | 'function'
 |      'given' | 'hidden' | 'hides' | 'inline' | 'into'
 |      'know' | 'knows' | 'lambda' | 'let' | 'methods'
 |      'namespace' | 'native'
 |      'obeys' | 'octet' | 'oneway' | 'operator'
 |      'package' | 'private' | 'protected' | 'public'
 |      'raises' | 'reliance' | 'reliant' | 'relies' | 'rely' | 'reveal'
 |      'sake' | 'signed' | 'static' | 'struct'
 |      'suchthat' | 'supports' | 'suspect' | 'suspects' | 'synchronized'
 |      'this' | 'transient' | 'truncatable' | 'typedef'
 |      'unsigned' | 'unum' | 'uses' | 'using' | 'utf8' | 'utf16'
 |      'virtual' | 'volatile' | 'wstring'
);


sepword	:	
        'catch' | 'else' | 'escape' | 'finally' | 'guards'
 |      'thunk' | 'fn' | 'try' | IDENT | reserverd
 |      '->'
;


///*    
//#Multi-Character Operators
//#TOKEN:operator:( '{' | '}' | '(' | ')' | ';' | ':=' | '||' | '&&' | '==' |
//#                 '!=' | '|' | '|=' | '^' | '^=' | '=~' | '!~' | '&' | '&=' |
//#                 '<' | '<=' | '>' | '>=' | '..' | '..!' | '<<' | '<<=' |
//#                 '>>' | '>>=' | '+' | '+=' | '-' | '-=' | '*' | '*=' |
//#                 '/' | '/=' | '//' | '//=' | '%' | '%=' | '%%' | '%%=' |
//#                 '**' | '**=' | '!' | '~' | '->' | '=>' | '::' | ':' |
//#                 '[' | ']' | '?' | ',' | '_' | '.' | '`' )
//*/




//# definition of grammar
//S : start;

start:
//        pragma (';')* | seq;
	(pragma (';' | LINESEP) | LINESEP)* seq;

//        #pragma (';'|linesep)* | (seq)*;
pragma:
        'pragma' '.' message;

metaExpr:
        'meta' '.' message;


seq:
//        eExpr (';' eExpr)*
        (eExpr ((';'|LINESEP) (eExpr)?)+)?
        ;

eExpr:
        assign; // | ejector ;
//#        defExpr | interfaceExpr | lambdaExpr | assign | ejector ;

/*
basic:
        ifExpr | forExpr | whileExpr | switchExpr | tryExpr
|       escapeExpr | whenExpr | metaExpr | accumExpr;

ifExpr:
        'if' parenExpr body ('else' (ifExpr | body))?
       ;

forExpr:
        'for' forPatt 'in' assign body (catcher)?
        //'for' forPatt 'in' br assign body (catcher)?
        ;

// the first pattern is actually the optional one. If it is missing, include an
// empty ignore pattern for it.
forPatt:
        pattern  ('=>' pattern)?
        ;

accumExpr:
        'accum' call accumulator
        ;

accumulator:
        'for' forPatt 'in' logical accumBody
 |      'if' parenExpr             accumBody
 |      'while' parenExpr          accumBody;

accumBody:
        '{' (  '_' (  ('+' | '*' | '&' | '|') assign
                     | '.' verb parenArgs)
              | accumulator
             ) '}'
             //) br '}'
        ;


whenExpr:
        'when' parenArgs '->'  whenFn (catcher)* ('finally' body)?
        ;

whenFn:
        objName params (':' guard)? body
        ;

whileExpr:
        'while' parenExpr body (catcher)?
        ;

escapeExpr:
        'escape' pattern body (catcher)?
        ;

lambdaExpr:
        'thunk' body
 |      'fn' paramList body
        ;

switchExpr:
        'switch' parenExpr '{' (matcher)* '}'
        //'switch' parenExpr '{' (matcher br)* '}'
        ;

tryExpr:
        'try' body (catcher)* ('finally' body)?
        ;

bindNamer:
        'bind' noun (':' guard)?
        ;

varNamer:
        'var' nounExpr (':' guard)?
        ;

slotNamer:
        '&' nounExpr (':' guard)?
        ;

// should forward declaration allow types?
docoDef:
        doco (defExpr | interfaceExpr | lambdaExpr)
        //[br] doco [br] (defExpr | interfaceExpr | lambdaExpr)
        ;


defExpr:
        'def'^ (  (objectPredict)  => objName objectExpr
                                                //{##.setType(ObjectExpr);}
                | (pattern ':=') => pattern ':=' rValue
                                                //{##.setType(IntoExpr);}
                | bindName //forward declaration
                                                //{##.setType(IntoExpr);}
               )
 |      'bind' bindExpr
 |      'var' bindExpr
 ;


rValue:
        ('(' eExpr (LINESEP)* ',') => '(' eExpr (LINESEP)* ',' eExpr (LINESEP)* ')'
                          // Can we support trinary-define with less lookahead?
 |      assign;

bindExpr:
        bindName
                 (  ':=' assign
                  | objectExpr
                 );



// minimize the look-ahead for objectExpr
objectPredict:
        objName ('extends' | 'implements' | '{'| '(' );


objectExpr:
        (  ('extends' order)?
           ('implements' order (',' order)*)?
           script
         | params resultGuard body      
        );

bindName_:
        (  nounExpr
         | '&' nounExpr
         | LiteralString 
        )
        ;

bindName: bindName_ (':' guard)?
        ;

objName_:
        '_'
 |      'bind' noun
 |      'var' nounExpr 
    ;

objName: bindName_ | objName_
    ;

script:
        '{' (method)* (matcher)* '}'
       // #'{' (method br)* (matcher br)* '}'
    ;

method:
        doco (  'to'     methHead body
              | 'method' methHead body
              | 'on'     methHead body
             ) 
        ;

methHead:
             params resultGuard
 |      verb params resultGuard;

matcher:
        'match' pattern body
        ;

params:
        '(' paramList ')'
        ;

paramList:
        ((key)? '=>') mapPattList
 |      (pattern (',' paramList)?)?
        ;

patternList:
        (pattern (',' patternList)? )?
        ;

resultGuard:
        (':' guard)? ('throws' guardList)?
        ;

//#requires at least one guard. cannot end with comma
guardList:
        guard (',' guard)*
        ;

interfaceExpr:
        'interface' objName 
        (  ('guards' pattern)?
           ('extends' order (',' order)*)?
           ('implements' order (',' order)*)?
           '{' (imethod)* '}'
         | mtypes (':' guard)?  
        )
        ;

imethod:
        doco (  'to' imethHead 
              | 'method' imethHead 
              | 'on' imethHead 
             )
        ;

ptype:
        nounExpr (':' guard)?
 |      '_' (':' guard)?
        ;

typeList:
        (ptype (',' typeList)? )?
        ;

mtypes:
        '(' typeList ')'
        ;

imethHead:
             mtypes resultGuard
 |      verb mtypes resultGuard;

// The current E grammar only let's you put these in a few places.
doco:
        (DOC_COMMENT)?
    ;



body:
        '{' seq '}' 
    ;
*/
assign: cond ( ':=' assign 
             | assignOp assign 
             )?
//xx |       docoDef
;
//| (verb '=') (parenArgs | assign)


assignOp:
        '//=' | '+=' | '-=' | '*=' | '/='
 |      '%=' | '%%=' | '**=' | '>>=' | '<<=' | '&='
 |      '^=' | '|=';

/*

ejector:
        (  'break'
         | 'continue'
         | 'return'
        ) (('(' ')') => '(' ')' | assign | )
 |      '^' assign
        ;
*/

// || is don't-care associative
cond:
        condAnd ('||' condAnd
                )*;

// && is don't-care associative
condAnd:
        logical ('&&' logical
                )*;

logical:
        order (  (  '==' order
                  |   '!=' order
                  |   '&!' order
                  |   '=~' pattern
                  |   '!~' pattern
                 )
               | ( '^' order)+
               | ( '&' order)+
               | ( '|' order)+
              )?
        ;   

order:
        interval ((  compareOp interval
                  | ':' guard
                 ))?
        ;

// The br for ">" is because it is used to close URIs, where it cannot have a
// br.
compareOp:
        '<' | '<=' | '<=>' | '>=' | '>'
        ;


// .. and ..! are both non-associative (no plural form)
interval:
        shift ( ('..' | '..!') shift)?
        ;

// << and >> are left-associative (no plural form)
shift:
        add ( ('<<' | '>>') add)*
        ;

//+ and - are left associative
add:
        mult (('+' | '-') mult)*
        ;

// *, /, //, %, and %% are left associative
mult:
        pow (('*' | '/' | '//' | '%' | '%%') pow)*
        ;

// ** is non-associative
pow:
        prefix ('**' prefix)?
        ;

// Unary prefix !, ~, &, *, and - are non-associative.
// Unary prefix !, ~, &, and * bind less tightly than unary postfix.
// Unary prefix -, because it will often be mistaken for part of a literal
// number rather than an operator, is not combinable with unary postfix, in
// order to avoid the following surprise:
//      -3.pow(2) ==> -9
// If -3 were a literal, the answer would be 9. So, in E, you must say either
//      (-3).pow(2)  or -(3.pow(2))
// to disambiguate which you mean.
prefix:
       postfix
 |     prefixOp  postfix
 |     '-' prim
 ;

prefixOp:
        ('!' | '~' | '&' | '*' | '+')
;

// Calls and sends are left associative.
postfix:
        call
        ;
// TODO deal with properties

call:
        prim (  parenArgs
                |  '.' message
                | '[' argList ']'
                |  '<-' (  parenArgs
                          | message
                          | '::' ('&')? prop
                         )
                |   '::' ('&')? prop
               )*
        ;




message:
        verb (  ('(') => parenArgs
              | //curry                      // {##.setType(CurryExpr);}
             );
             
parenArgs:
        '(' argList ')';
/*
lambdaArgs:
        '(' argList ')' (sepword body)?
        ; 

exprList:
        (eExpr (',' eExpr)*)?
        ;
*/

argList:
        ((eExpr)? '=>') => mapList             // {warn("map-tail");}
 |      (eExpr (LINESEP)* (',' argList)?)?
 ;

/*


prim:
        literal
 |      basic
 |      nounExpr (quasiString                   //{##=#([QuasiLiteralExpr],##);}
                 )?
 |      parenExpr (quasiString                  //{##=#([QuasiLiteralExpr],##);
                                       //   warn("***We may deprecate this***");}
                  )?
 |      quasiString                           //  {##=#([QuasiLiteralExpr,
                                              //         "simple"],
                                              //        [STRING,"simple"],##);}
// |      URI                                     {##=#([URIExpr],##);}
 |      '['^ (  ((eExpr)? '=>') => mapList    //  {##.setType(MapExpr);}
              | exprList                      //  {##.setType(TupleExpr);}
             ) ']'
 |      body                                  //  {##=#([HideExpr],##);}
 ;


*/

mapList:
        (map (',' map)*)?
        ;


map:
        eExpr '=>' eExpr
 |      '=>' (  nounExpr
               | '&' nounExpr
               | 'def' nounExpr
             )
 ;
 
/*
//Property names for use e.g., with the :: syntax.
// Should the "&" handling be here?
prop:
        IDENT | LiteralString;

*/
// a method selector
verb:
        IDENT | LiteralString;
/*
//// a numeric literal
integer:            ('0x') => '0x' (HEX_DIGIT)+  //{ $setType(HEX); }
            |   OCTAL
            |   (FLOAT64) => FLOAT64  //{ $setType(FLOAT64); }
            |   POSINT
            ;

//literal:
//        (int | HEXNUM | OCTALNUM | LiteralString | CHAR_LITERAL );
literal:
        LiteralString | CHAR_LITERAL | integer;
        //#(int | float64 | hex | octal | <LiteralString> | <char_literal> );
        //# int contiene a | <LiteralFloat64> 
*/
noun:
        IDENT
 |      uriGetter
 |      '::' (LiteralString | IDENT);

//#### revisar acá la definición de urigetter sacada de elex.g
//#uriGetter=  '<' <IDENT>  [':' [(<URI>|<IDENT>)+]] '>';
uriGetter:  URI;

/*

// A guard is a nounExpr, a URI, a parenExpr, or a guard followed by [argList].
guard:
        (nounExpr | parenExpr) ('[' argList ']')*
        ;

catcher:
        'catch' pattern body
        ;
*/
// Patterns
pattern:
        subPattern ('?' parenExpr)?
        ;

subPattern:
        nounExpr ( ':' guard
                  | quasiString
                 )?
 |      '_' (':' guard)?
 |      ':' guard
 |      bindNamer
 |      varNamer
 |      slotNamer
 |      quasiString
 |      '==' prim
 |      '!=' prim
 |      compareOp prim
 |      ('[' (key)? '=>') '[' mapPattList ']' ('|' subPattern)?
 |      '[' patternList ']' (  (':' guard)?
                                  | ('+' subPattern)
                                 )
        ;


// namePatts are patterns that bind exactly one name.
// this is expanded inline into eqPatt, but used directly elsewhere
namePatt:
        nounExpr (':' guard)?
 |      bindNamer
 |      varNamer
 |      slotNamer
        ;
*/
nounExpr:
        noun
 |      dollarHole
 |      atHole
        ;

dollarHole:'$' ('{' POSINT '}'|POSINT|'$');
        

//'$' ('{' <POSINT> '}'|<POSINT>|'$')

atHole:
        '@{' POSINT '}'
|       '@' POSINT
;
//        #'@' ('{' <LiteralInteger> '}'|<LiteralInteger>);
//        #'@' ('{' <POSINT> '}'|<POSINT>);
/*
key:
        parenExpr | literal;

parenExpr:
        '(' seq ')';

mapPattList:
        (mapPattern (',' mapPattList)? )?;

mapPattern:
        key '=>' pattern  (':=' order)?
 |          '=>' namePatt (':=' order)?;

// QUASI support


quasiString:
        '`' (  exprHole
                    | pattHole
                    | QUASIBODY
                    | dollarHole
                    | atHole
                   )*                         //  {##=#([QuasiContent],##);}
        '`';  // NOTE: '`' is the QUASICLOSE token in the quasi lexer



exprHole:
        DollarOpen^ (LINESEP)* eExpr (LINESEP)*              //  {##.setType(DOLLARHOLE);}
        '}';


pattHole:
        AtOpen (LINESEP)* pattern (LINESEP)*               //   {##.setType(ATHOLE);}
        '}';



*/