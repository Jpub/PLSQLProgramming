SET ECHO ON
SET TAB OFF
SET SERVEROUTPUT ON

DECLARE
  x varchar2(10) ;
BEGIN
  x := 'SMITH' ; print_boolean(Q'['SMITH' LIKE 'S%'    ]', x LIKE 'S%') ;
  x := 'SMITH' ; print_boolean(Q'['SMITH' LIKE 'S____' ]', x LIKE 'S____') ;
  x := 'SMITH' ; print_boolean(Q'['SMITH' LIKE 'SMITH' ]', x LIKE 'SMITH') ;
  x := 'SMITH' ; print_boolean(Q'['SMITH' LIKE 's%'    ]', x LIKE 's%') ;
  x := 'SMITH' ; print_boolean(Q'['SMITH' NOT LIKE 's%']', x NOT LIKE 's%') ;
  x := NULL    ; print_boolean(Q'[NULL LIKE 'A'        ]', x LIKE 'A') ;
  x := NULL    ; print_boolean(Q'[NULL NOT LIKE 'A'    ]', x NOT LIKE 'A') ;
  x := '한글'  ; print_boolean(Q'['한글' LIKE '__'     ]', '한글' LIKE '__') ;
END ;
/
