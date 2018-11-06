Normalize fat table to long skinny when input has numer ranges

github
https://tinyurl.com/y8lm4fz3
https://github.com/rogerjdeangelis/utl-normalize-fat-table-to-long-skinny-when-input-has-number-ranges

SAS Forum
https://tinyurl.com/ya4zfkxo
https://communities.sas.com/t5/New-SAS-User/Extract-all-numerics-between-a-range/m-p/510731

INPUT AND PROCESS
=================

data have(keep=var val);

  input;

   var  = scan(_infile_,1);
   var2 = scan(_infile_,2,' -');
   var3 = scan(_infile_,2,'-');

   do val = var2 to coalescec(var3,var2);
      output;
   end;

cards4;
a 305
a 306-308
b 400
b 401-405
;;;;
run;quit;


OUTPUT
======

 WORK.HAVE total obs=10

               |  RULES
  VAR    VAL   |
               |
   a     305   |  305

   a     306   |  306-308 (normalize)
   a     307   |
   a     308   |

   b     400   |  401

   b     401   |  401-405 (normalize)
   b     402   |
   b     403   |
   b     404   |
   b     405   |

