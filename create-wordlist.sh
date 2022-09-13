#!/bin/bash



print_wordlist () {

	name=$1
   	arr=( $@ )

	echo "(defvar $name '("

   	for i in "${arr[@]:1}";
      	do
       	   echo "	\"$i\""
      	done

	echo "))" 

}

RESERVED_WORDS=`cobc -list-reserved | sed -n '/3-D/,/Extra/{/Extra/!p;}' |  awk ' { print $1 } '`
INTRINSIC_WORDS=`cobc -list-intrinsics | awk ' { print $1  }' | awk 'NR>2'`
MNEMONICS_WORDS=`cobc -list-mnemonics | awk ' { print $1 } ' | awk 'NR>3'`
SYSTEM_WORDS=`cobc -list-system | awk ' { print $1 } ' | awk 'NR>4' `

print_wordlist "reserved-words" $RESERVED_WORDS
print_wordlist "instrinsic-words" $INTRINSIC_WORDS
print_wordlist "mnemonics-words" $MNEMONICS_WORDS
print_wordlist "system-words" $SYSTEM_WORDS



exit 
# echo "(defvar system-words $SYSTEM_WORDS )"
# echo "(defvar mnemonic-words $INTRINSIC_WORDS )"
# echo "(defvar system-words $SYSTEM_WORDS )" 
