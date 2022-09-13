;;; gnucobol.el -- summary

;; Author:   Wade Mealing
;; Version   0.0.1
;; Created:  28 Aug 2022.
;; Keywords: languages gnucobol

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is my first attempt at a major mode, the cobol mode that exists
;; in the current Emacs, doesn't work for me.  I dont know how to make it
;; work as its a LOT of regex.


;;; Code:


(defvar gnucobol-mode-hook nil "A major mode for GnuCOBOL.")

(defvar cobol-tab-width 4 "Width of a tab for `cobol-mode'.")

(defvar reserved-words '("3-D"
	                 "ABSENT"
	                 "ACCEPT"
	                 "ACCESS"
	                 "ACTION"
	                 "ACTIVE-CLASS"
	                 "ACTIVE-X"
	                 "ACTUAL"
	                 "ADD"
	                 "ADDRESS"
	                 "ADJUSTABLE-COLUMNS"
	                 "ADVANCING"
	                 "AFTER"
	                 "ALIGNED"
	                 "ALIGNMENT"
	                 "ALL"
	                 "ALLOCATE"
	                 "ALLOWING"
	                 "ALPHABET"
	                 "ALPHABETIC"
	                 "ALPHABETIC-LOWER"
	                 "ALPHABETIC-UPPER"
	                 "ALPHANUMERIC"
	                 "ALPHANUMERIC-EDITED"
	                 "ALSO"
	                 "ALTER"
	                 "ALTERNATE"
	                 "AND"
	                 "ANY"
	                 "ANYCASE"
	                 "APPLY"
	                 "ARE"
	                 "AREA"
	                 "AREAS"
	                 "ARGUMENT-NUMBER"
	                 "ARGUMENT-VALUE"
	                 "ARITHMETIC"
	                 "AS"
	                 "ASCENDING"
	                 "ASCII"
	                 "ASSIGN"
	                 "AT"
	                 "ATTRIBUTE"
	                 "ATTRIBUTES"
	                 "AUTO"
	                 "AUTO-DECIMAL"
	                 "AUTO-SKIP"
	                 "AUTO-SPIN"
	                 "AUTOMATIC"
	                 "AUTOTERMINATE"
	                 "AWAY-FROM-ZERO"
	                 "B-AND"
	                 "B-NOT"
	                 "B-OR"
	                 "B-XOR"
	                 "BACKGROUND-COLOR"
	                 "BACKGROUND-COLOUR"
	                 "BACKGROUND-HIGH"
	                 "BACKGROUND-LOW"
	                 "BACKGROUND-STANDARD"
	                 "BAR"
	                 "BASED"
	                 "BEEP"
	                 "BEFORE"
	                 "BELL"
	                 "BINARY"
	                 "BINARY-C-LONG"
	                 "BINARY-CHAR"
	                 "BINARY-DOUBLE"
	                 "BINARY-INT"
	                 "BINARY-LONG"
	                 "BINARY-LONG-LONG"
	                 "BINARY-SEQUENTIAL"
	                 "BINARY-SHORT"
	                 "BIT"
	                 "BITMAP"
	                 "BITMAP-END"
	                 "BITMAP-HANDLE"
	                 "BITMAP-NUMBER"
	                 "BITMAP-START"
	                 "BITMAP-TIMER"
	                 "BITMAP-TRAILING"
	                 "BITMAP-TRANSPARENT-COLOR"
	                 "BITMAP-WIDTH"
	                 "BLANK"
	                 "BLINK"
	                 "BLOCK"
	                 "BOOLEAN"
	                 "BOTTOM"
	                 "BOX"
	                 "BOXED"
	                 "BULK-ADDITION"
	                 "BUSY"
	                 "BUTTONS"
	                 "BY"
	                 "BYTE-LENGTH"
	                 "C"
	                 "CALENDAR-FONT"
	                 "CALL"
	                 "CANCEL"
	                 "CANCEL-BUTTON"
	                 "CAPACITY"
	                 "CARD-PUNCH"
	                 "CARD-READER"
	                 "CASSETTE"
	                 "CCOL"
	                 "CD"
	                 "CELL"
	                 "CELL-COLOR"
	                 "CELL-DATA"
	                 "CELL-FONT"
	                 "CELL-PROTECTION"
	                 "CELLS"
	                 "CENTER"
	                 "CENTERED"
	                 "CENTERED-HEADINGS"
	                 "CENTURY-DATE"
	                 "CF"
	                 "CH"
	                 "CHAIN"
	                 "CHAINING"
	                 "CHANGED"
	                 "CHARACTER"
	                 "CHARACTERS"
	                 "CHECK-BOX"
	                 "CLASS"
	                 "CLASS-ID"
	                 "CLASSIFICATION"
	                 "CLEAR-SELECTION"
	                 "CLINE"
	                 "CLINES"
	                 "CLOSE"
	                 "COBOL"
	                 "CODE"
	                 "CODE-SET"
	                 "COL"
	                 "COLLATING"
	                 "COLOR"
	                 "COLORS"
	                 "COLOURS"
	                 "COLS"
	                 "COLUMN"
	                 "COLUMN-COLOR"
	                 "COLUMN-DIVIDERS"
	                 "COLUMN-FONT"
	                 "COLUMN-HEADINGS"
	                 "COLUMN-PROTECTION"
	                 "COLUMNS"
	                 "COMBO-BOX"
	                 "COMMA"
	                 "COMMAND-LINE"
	                 "COMMIT"
	                 "COMMON"
	                 "COMMUNICATION"
	                 "COMP"
	                 "COMP-0"
	                 "COMP-1"
	                 "COMP-2"
	                 "COMP-3"
	                 "COMP-4"
	                 "COMP-5"
	                 "COMP-6"
	                 "COMP-N"
	                 "COMP-X"
	                 "COMPUTATIONAL"
	                 "COMPUTATIONAL-0"
	                 "COMPUTATIONAL-1"
	                 "COMPUTATIONAL-2"
	                 "COMPUTATIONAL-3"
	                 "COMPUTATIONAL-4"
	                 "COMPUTATIONAL-5"
	                 "COMPUTATIONAL-6"
	                 "COMPUTATIONAL-N"
	                 "COMPUTATIONAL-X"
	                 "COMPUTE"
	                 "CONDITION"
	                 "CONFIGURATION"
	                 "CONSTANT"
	                 "CONTAINS"
	                 "CONTENT"
	                 "CONTINUE"
	                 "CONTROL"
	                 "CONTROLS"
	                 "CONVERSION"
	                 "CONVERTING"
	                 "COPY"
	                 "COPY-SELECTION"
	                 "CORE-INDEX"
	                 "CORR"
	                 "CORRESPONDING"
	                 "COUNT"
	                 "CRT"
	                 "CRT-UNDER"
	                 "CSIZE"
	                 "CURRENCY"
	                 "CURSOR"
	                 "CURSOR-COL"
	                 "CURSOR-COLOR"
	                 "CURSOR-FRAME-WIDTH"
	                 "CURSOR-ROW"
	                 "CURSOR-X"
	                 "CURSOR-Y"
	                 "CUSTOM-PRINT-TEMPLATE"
	                 "CYCLE"
	                 "CYL-INDEX"
	                 "CYL-OVERFLOW"
	                 "DASHED"
	                 "DATA"
	                 "DATA-COLUMNS"
	                 "DATA-POINTER"
	                 "DATA-TYPES"
	                 "DATE"
	                 "DATE-ENTRY"
	                 "DAY"
	                 "DAY-OF-WEEK"
	                 "DE"
	                 "DEBUGGING"
	                 "DECIMAL-POINT"
	                 "DECLARATIVES"
	                 "DEFAULT"
	                 "DEFAULT-BUTTON"
	                 "DEFAULT-FONT"
	                 "DELETE"
	                 "DELIMITED"
	                 "DELIMITER"
	                 "DEPENDING"
	                 "DESCENDING"
	                 "DESTINATION"
	                 "DESTROY"
	                 "DETAIL"
	                 "DISABLE"
	                 "DISC"
	                 "DISK"
	                 "DISP"
	                 "DISPLAY"
	                 "DISPLAY-COLUMNS"
	                 "DISPLAY-FORMAT"
	                 "DIVIDE"
	                 "DIVIDER-COLOR"
	                 "DIVIDERS"
	                 "DIVISION"
	                 "DOTDASH"
	                 "DOTTED"
	                 "DOUBLE"
	                 "DOWN"
	                 "DRAG-COLOR"
	                 "DROP-DOWN"
	                 "DROP-LIST"
	                 "DUPLICATES"
	                 "DYNAMIC"
	                 "EBCDIC"
	                 "EC"
	                 "ECHO"
	                 "EGI"
	                 "ELEMENT"
	                 "ELSE"
	                 "EMI"
	                 "EMPTY-CHECK"
	                 "ENABLE"
	                 "ENCODING"
	                 "ENCRYPTION"
	                 "END"
	                 "END-ACCEPT"
	                 "END-ADD"
	                 "END-CALL"
	                 "END-CHAIN"
	                 "END-COLOR"
	                 "END-COMPUTE"
	                 "END-DELETE"
	                 "END-DISPLAY"
	                 "END-DIVIDE"
	                 "END-EVALUATE"
	                 "END-IF"
	                 "END-JSON"
	                 "END-MODIFY"
	                 "END-MULTIPLY"
	                 "END-OF-PAGE"
	                 "END-PERFORM"
	                 "END-READ"
	                 "END-RECEIVE"
	                 "END-RETURN"
	                 "END-REWRITE"
	                 "END-SEARCH"
	                 "END-START"
	                 "END-STRING"
	                 "END-SUBTRACT"
	                 "END-UNSTRING"
	                 "END-WRITE"
	                 "END-XML"
	                 "ENGRAVED"
	                 "ENSURE-VISIBLE"
	                 "ENTRY"
	                 "ENTRY-CONVENTION"
	                 "ENTRY-FIELD"
	                 "ENTRY-REASON"
	                 "ENVIRONMENT"
	                 "ENVIRONMENT-NAME"
	                 "ENVIRONMENT-VALUE"
	                 "EO"
	                 "EOL"
	                 "EOP"
	                 "EOS"
	                 "EQUAL"
	                 "EQUALS"
	                 "ERASE"
	                 "ERROR"
	                 "ESCAPE"
	                 "ESCAPE-BUTTON"
	                 "ESI"
	                 "EVALUATE"
	                 "EVENT"
	                 "EVENT-LIST"
	                 "EVERY"
	                 "EXCEPTION"
	                 "EXCEPTION-OBJECT"
	                 "EXCEPTION-VALUE"
	                 "EXCLUSIVE"
	                 "EXHIBIT"
	                 "EXIT"
	                 "EXPAND"
	                 "EXPANDS"
	                 "EXTEND"
	                 "EXTENDED-SEARCH"
	                 "EXTERN"
	                 "EXTERNAL"
	                 "EXTERNAL-FORM"
	                 "F"
	                 "FACTORY"
	                 "FALSE"
	                 "FD"
	                 "FH--FCD"
	                 "FH--KEYDEF"
	                 "FILE"
	                 "FILE-CONTROL"
	                 "FILE-ID"
	                 "FILE-LIMIT"
	                 "FILE-LIMITS"
	                 "FILE-NAME"
	                 "FILE-POS"
	                 "FILL-COLOR"
	                 "FILL-COLOR2"
	                 "FILL-PERCENT"
	                 "FILLER"
	                 "FINAL"
	                 "FINISH-REASON"
	                 "FIRST"
	                 "FIXED"
	                 "FIXED-FONT"
	                 "FIXED-WIDTH"
	                 "FLAT"
	                 "FLAT-BUTTONS"
	                 "FLOAT"
	                 "FLOAT-BINARY-128"
	                 "FLOAT-BINARY-32"
	                 "FLOAT-BINARY-64"
	                 "FLOAT-DECIMAL-16"
	                 "FLOAT-DECIMAL-34"
	                 "FLOAT-EXTENDED"
	                 "FLOAT-INFINITY"
	                 "FLOAT-LONG"
	                 "FLOAT-NOT-A-NUMBER"
	                 "FLOAT-SHORT"
	                 "FLOATING"
	                 "FONT"
	                 "FOOTING"
	                 "FOR"
	                 "FOREGROUND-COLOR"
	                 "FOREGROUND-COLOUR"
	                 "FOREVER"
	                 "FORMAT"
	                 "FRAME"
	                 "FRAMED"
	                 "FREE"
	                 "FROM"
	                 "FULL"
	                 "FULL-HEIGHT"
	                 "FUNCTION"
	                 "FUNCTION-ID"
	                 "FUNCTION-POINTER"
	                 "GENERATE"
	                 "GET"
	                 "GIVING"
	                 "GLOBAL"
	                 "GO"
	                 "GO-BACK"
	                 "GO-FORWARD"
	                 "GO-HOME"
	                 "GO-SEARCH"
	                 "GOBACK"
	                 "GRAPHICAL"
	                 "GREATER"
	                 "GRID"
	                 "GROUP"
	                 "GROUP-USAGE"
	                 "GROUP-VALUE"
	                 "HANDLE"
	                 "HAS-CHILDREN"
	                 "HEADING"
	                 "HEADING-COLOR"
	                 "HEADING-DIVIDER-COLOR"
	                 "HEADING-FONT"
	                 "HEAVY"
	                 "HEIGHT-IN-CELLS"
	                 "HIDDEN-DATA"
	                 "HIGH-COLOR"
	                 "HIGH-VALUE"
	                 "HIGH-VALUES"
	                 "HIGHLIGHT"
	                 "HOT-TRACK"
	                 "HSCROLL"
	                 "HSCROLL-POS"
	                 "I-O"
	                 "I-O-CONTROL"
	                 "ICON"
	                 "ID"
	                 "IDENTIFICATION"
	                 "IDENTIFIED"
	                 "IF"
	                 "IGNORE"
	                 "IGNORING"
	                 "IMPLEMENTS"
	                 "IN"
	                 "INDEPENDENT"
	                 "INDEX"
	                 "INDEXED"
	                 "INDICATE"
	                 "INHERITS"
	                 "INITIAL"
	                 "INITIALISE"
	                 "INITIALISED"
	                 "INITIALIZE"
	                 "INITIALIZED"
	                 "INITIATE"
	                 "INPUT"
	                 "INPUT-OUTPUT"
	                 "INQUIRE"
	                 "INSERT-ROWS"
	                 "INSERTION-INDEX"
	                 "INSPECT"
	                 "INTERFACE"
	                 "INTERFACE-ID"
	                 "INTERMEDIATE"
	                 "INTO"
	                 "INTRINSIC"
	                 "INVALID"
	                 "INVOKE"
	                 "IS"
	                 "ITEM"
	                 "ITEM-TEXT"
	                 "ITEM-TO-ADD"
	                 "ITEM-TO-DELETE"
	                 "ITEM-TO-EMPTY"
	                 "ITEM-VALUE"
	                 "JSON"
	                 "JUST"
	                 "JUSTIFIED"
	                 "KEPT"
	                 "KEY"
	                 "KEYBOARD"
	                 "LABEL"
	                 "LABEL-OFFSET"
	                 "LARGE-FONT"
	                 "LARGE-OFFSET"
	                 "LAST"
	                 "LAST-ROW"
	                 "LAYOUT-DATA"
	                 "LAYOUT-MANAGER"
	                 "LC_ALL"
	                 "LC_COLLATE"
	                 "LC_CTYPE"
	                 "LC_MESSAGES"
	                 "LC_MONETARY"
	                 "LC_NUMERIC"
	                 "LC_TIME"
	                 "LEADING"
	                 "LEADING-SHIFT"
	                 "LEAVE"
	                 "LEFT"
	                 "LEFT-JUSTIFY"
	                 "LEFT-TEXT"
	                 "LEFTLINE"
	                 "LENGTH"
	                 "LENGTH-CHECK"
	                 "LESS"
	                 "LIKE"
	                 "LIMIT"
	                 "LIMITS"
	                 "LINAGE"
	                 "LINAGE-COUNTER"
	                 "LINE"
	                 "LINE-COUNTER"
	                 "LINE-SEQUENTIAL"
	                 "LINES"
	                 "LINES-AT-ROOT"
	                 "LINKAGE"
	                 "LIST-BOX"
	                 "LM-RESIZE"
	                 "LOC"
	                 "LOCAL-STORAGE"
	                 "LOCALE"
	                 "LOCK"
	                 "LOCK-HOLDING"
	                 "LONG-DATE"
	                 "LOW-COLOR"
	                 "LOW-VALUE"
	                 "LOW-VALUES"
	                 "LOWER"
	                 "LOWERED"
	                 "LOWLIGHT"
	                 "MAGNETIC-TAPE"
	                 "MANUAL"
	                 "MASS-UPDATE"
	                 "MASTER-INDEX"
	                 "MAX-LINES"
	                 "MAX-PROGRESS"
	                 "MAX-TEXT"
	                 "MAX-VAL"
	                 "MEDIUM-FONT"
	                 "MEMORY"
	                 "MENU"
	                 "MERGE"
	                 "MESSAGE"
	                 "METHOD"
	                 "METHOD-ID"
	                 "MIN-VAL"
	                 "MINUS"
	                 "MODE"
	                 "MODIFY"
	                 "MODULES"
	                 "MOVE"
	                 "MULTILINE"
	                 "MULTIPLE"
	                 "MULTIPLY"
	                 "NAME"
	                 "NAMED"
	                 "NAMESPACE"
	                 "NAMESPACE-PREFIX"
	                 "NATIONAL"
	                 "NATIONAL-EDITED"
	                 "NATIVE"
	                 "NAVIGATE-URL"
	                 "NEAREST-AWAY-FROM-ZERO"
	                 "NEAREST-EVEN"
	                 "NEAREST-TOWARD-ZERO"
	                 "NEGATIVE"
	                 "NESTED"
	                 "NEW"
	                 "NEXT"
	                 "NEXT-ITEM"
	                 "NO"
	                 "NO-AUTO-DEFAULT"
	                 "NO-AUTOSEL"
	                 "NO-BOX"
	                 "NO-DIVIDERS"
	                 "NO-ECHO"
	                 "NO-F4"
	                 "NO-FOCUS"
	                 "NO-GROUP-TAB"
	                 "NO-KEY-LETTER"
	                 "NO-SEARCH"
	                 "NO-UPDOWN"
	                 "NOMINAL"
	                 "NONE"
	                 "NONNUMERIC"
	                 "NORMAL"
	                 "NOT"
	                 "NOTAB"
	                 "NOTHING"
	                 "NOTIFY"
	                 "NOTIFY-CHANGE"
	                 "NOTIFY-DBLCLICK"
	                 "NOTIFY-SELCHANGE"
	                 "NULL"
	                 "NULLS"
	                 "NUM-COL-HEADINGS"
	                 "NUM-ROWS"
	                 "NUMBER"
	                 "NUMBERS"
	                 "NUMERIC"
	                 "NUMERIC-EDITED"
	                 "OBJECT"
	                 "OBJECT-COMPUTER"
	                 "OBJECT-REFERENCE"
	                 "OCCURS"
	                 "OF"
	                 "OFF"
	                 "OK-BUTTON"
	                 "OMITTED"
	                 "ON"
	                 "ONLY"
	                 "OPEN"
	                 "OPTIONAL"
	                 "OPTIONS"
	                 "OR"
	                 "ORDER"
	                 "ORGANISATION"
	                 "ORGANIZATION"
	                 "OTHER"
	                 "OTHERS"
	                 "OUTPUT"
	                 "OVERFLOW"
	                 "OVERLAP-LEFT"
	                 "OVERLAP-TOP"
	                 "OVERLINE"
	                 "OVERRIDE"
	                 "PACKED-DECIMAL"
	                 "PADDING"
	                 "PAGE"
	                 "PAGE-COUNTER"
	                 "PAGE-SETUP"
	                 "PAGED"
	                 "PARAGRAPH"
	                 "PARENT"
	                 "PARSE"
	                 "PASCAL"
	                 "PASSWORD"
	                 "PERFORM"
	                 "PERMANENT"
	                 "PF"
	                 "PH"
	                 "PHYSICAL"
	                 "PIC"
	                 "PICTURE"
	                 "PIXEL"
	                 "PIXELS"
	                 "PLACEMENT"
	                 "PLUS"
	                 "POINTER"
	                 "POP-UP"
	                 "POS"
	                 "POSITION"
	                 "POSITION-SHIFT"
	                 "POSITIVE"
	                 "PREFIXED"
	                 "PRESENT"
	                 "PREVIOUS"
	                 "PRINT"
	                 "PRINT-NO-PROMPT"
	                 "PRINT-PREVIEW"
	                 "PRINTER"
	                 "PRINTER-1"
	                 "PRINTING"
	                 "PRIORITY"
	                 "PROCEDURE"
	                 "PROCEDURE-POINTER"
	                 "PROCEDURES"
	                 "PROCEED"
	                 "PROCESSING"
	                 "PROGRAM"
	                 "PROGRAM-ID"
	                 "PROGRAM-POINTER"
	                 "PROGRESS"
	                 "PROHIBITED"
	                 "PROMPT"
	                 "PROPERTIES"
	                 "PROPERTY"
	                 "PROTECTED"
	                 "PROTOTYPE"
	                 "PURGE"
	                 "PUSH-BUTTON"
	                 "QUERY-INDEX"
	                 "QUEUE"
	                 "QUOTE"
	                 "QUOTES"
	                 "RADIO-BUTTON"
	                 "RAISE"
	                 "RAISED"
	                 "RAISING"
	                 "RANDOM"
	                 "RD"
	                 "READ"
	                 "READ-ONLY"
	                 "READERS"
	                 "RECEIVE"
	                 "RECORD"
	                 "RECORD-DATA"
	                 "RECORD-OVERFLOW"
	                 "RECORD-TO-ADD"
	                 "RECORD-TO-DELETE"
	                 "RECORDING"
	                 "RECORDS"
	                 "RECURSIVE"
	                 "REDEFINES"
	                 "REEL"
	                 "REFERENCE"
	                 "REFERENCES"
	                 "REFRESH"
	                 "REGION-COLOR"
	                 "RELATION"
	                 "RELATIVE"
	                 "RELEASE"
	                 "REMAINDER"
	                 "REMOVAL"
	                 "RENAMES"
	                 "REORG-CRITERIA"
	                 "REPLACE"
	                 "REPLACING"
	                 "REPORT"
	                 "REPORTING"
	                 "REPORTS"
	                 "REPOSITORY"
	                 "REQUIRED"
	                 "REREAD"
	                 "RERUN"
	                 "RESERVE"
	                 "RESET"
	                 "RESET-GRID"
	                 "RESET-LIST"
	                 "RESET-TABS"
	                 "RESUME"
	                 "RETRY"
	                 "RETURN"
	                 "RETURNING"
	                 "REVERSE"
	                 "REVERSE-VIDEO"
	                 "REVERSED"
	                 "REWIND"
	                 "REWRITE"
	                 "RF"
	                 "RH"
	                 "RIGHT"
	                 "RIGHT-ALIGN"
	                 "RIGHT-JUSTIFY"
	                 "RIMMED"
	                 "ROLLBACK"
	                 "ROUNDED"
	                 "ROUNDING"
	                 "ROW-COLOR"
	                 "ROW-COLOR-PATTERN"
	                 "ROW-DIVIDERS"
	                 "ROW-FONT"
	                 "ROW-HEADINGS"
	                 "ROW-PROTECTION"
	                 "RUN"
	                 "S"
	                 "SAME"
	                 "SAVE-AS"
	                 "SAVE-AS-NO-PROMPT"
	                 "SCREEN"
	                 "SCROLL"
	                 "SCROLL-BAR"
	                 "SD"
	                 "SEARCH"
	                 "SEARCH-OPTIONS"
	                 "SEARCH-TEXT"
	                 "SECONDS"
	                 "SECTION"
	                 "SECURE"
	                 "SEGMENT"
	                 "SEGMENT-LIMIT"
	                 "SELECT"
	                 "SELECT-ALL"
	                 "SELECTION-INDEX"
	                 "SELECTION-TEXT"
	                 "SELF"
	                 "SELF-ACT"
	                 "SEND"
	                 "SENTENCE"
	                 "SEPARATE"
	                 "SEPARATION"
	                 "SEQUENCE"
	                 "SEQUENTIAL"
	                 "SET"
	                 "SHADING"
	                 "SHADOW"
	                 "SHARING"
	                 "SHORT-DATE"
	                 "SHOW-LINES"
	                 "SHOW-NONE"
	                 "SHOW-SEL-ALWAYS"
	                 "SIGN"
	                 "SIGNED"
	                 "SIGNED-INT"
	                 "SIGNED-LONG"
	                 "SIGNED-SHORT"
	                 "SIZE"
	                 "SMALL-FONT"
	                 "SORT"
	                 "SORT-MERGE"
	                 "SORT-ORDER"
	                 "SOURCE"
	                 "SOURCE-COMPUTER"
	                 "SOURCES"
	                 "SPACE"
	                 "SPACE-FILL"
	                 "SPACES"
	                 "SPECIAL-NAMES"
	                 "SPINNER"
	                 "SQUARE"
	                 "STANDARD"
	                 "STANDARD-1"
	                 "STANDARD-2"
	                 "STANDARD-BINARY"
	                 "STANDARD-DECIMAL"
	                 "START"
	                 "START-X"
	                 "START-Y"
	                 "STATEMENT"
	                 "STATIC"
	                 "STATIC-LIST"
	                 "STATUS"
	                 "STATUS-BAR"
	                 "STATUS-TEXT"
	                 "STDCALL"
	                 "STEP"
	                 "STOP"
	                 "STRING"
	                 "STRONG"
	                 "STYLE"
	                 "SUB-QUEUE-1"
	                 "SUB-QUEUE-2"
	                 "SUB-QUEUE-3"
	                 "SUBTRACT"
	                 "SUBWINDOW"
	                 "SUM"
	                 "SUPER"
	                 "SUPPRESS"
	                 "SYMBOL"
	                 "SYMBOLIC"
	                 "SYNC"
	                 "SYNCHRONISED"
	                 "SYNCHRONIZED"
	                 "SYSTEM-DEFAULT"
	                 "SYSTEM-INFO"
	                 "SYSTEM-OFFSET"
	                 "TAB"
	                 "TAB-TO-ADD"
	                 "TAB-TO-DELETE"
	                 "TABLE"
	                 "TALLYING"
	                 "TAPE"
	                 "TEMPORARY"
	                 "TERMINAL-INFO"
	                 "TERMINATE"
	                 "TERMINATION-VALUE"
	                 "TEST"
	                 "TEXT"
	                 "THAN"
	                 "THEN"
	                 "THREAD"
	                 "THREADS"
	                 "THROUGH"
	                 "THRU"
	                 "THUMB-POSITION"
	                 "TILED-HEADINGS"
	                 "TIME"
	                 "TIME-OUT"
	                 "TIMEOUT"
	                 "TIMES"
	                 "TITLE"
	                 "TITLE-POSITION"
	                 "TO"
	                 "TOP"
	                 "TOWARD-GREATER"
	                 "TOWARD-LESSER"
	                 "TRACK"
	                 "TRACK-AREA"
	                 "TRACK-LIMIT"
	                 "TRACKS"
	                 "TRADITIONAL-FONT"
	                 "TRAILING"
	                 "TRAILING-SHIFT"
	                 "TRAILING-SIGN"
	                 "TRANSFORM"
	                 "TRANSPARENT"
	                 "TREE-VIEW"
	                 "TRUE"
	                 "TRUNCATION"
	                 "TYPE"
	                 "TYPEDEF"
	                 "U"
	                 "UCS-4"
	                 "UNBOUNDED"
	                 "UNDERLINE"
	                 "UNFRAMED"
	                 "UNIT"
	                 "UNIVERSAL"
	                 "UNLOCK"
	                 "UNSIGNED"
	                 "UNSIGNED-INT"
	                 "UNSIGNED-LONG"
	                 "UNSIGNED-SHORT"
	                 "UNSORTED"
	                 "UNSTRING"
	                 "UNTIL"
	                 "UP"
	                 "UPDATE"
	                 "UPDATERS"
	                 "UPON"
	                 "UPPER"
	                 "USAGE"
	                 "USE"
	                 "USE-ALT"
	                 "USE-RETURN"
	                 "USE-TAB"
	                 "USER"
	                 "USER-DEFAULT"
	                 "USING"
	                 "UTF-16"
	                 "UTF-8"
	                 "V"
	                 "VAL-STATUS"
	                 "VALID"
	                 "VALIDATE"
	                 "VALIDATE-STATUS"
	                 "VALIDATING"
	                 "VALUE"
	                 "VALUE-FORMAT"
	                 "VALUES"
	                 "VARIABLE"
	                 "VARIANT"
	                 "VARYING"
	                 "VERTICAL"
	                 "VERY-HEAVY"
	                 "VIRTUAL-WIDTH"
	                 "VOLATILE"
	                 "VPADDING"
	                 "VSCROLL"
	                 "VSCROLL-BAR"
	                 "VSCROLL-POS"
	                 "VTOP"
	                 "WAIT"
	                 "WEB-BROWSER"
	                 "WHEN"
	                 "WIDTH"
	                 "WIDTH-IN-CELLS"
	                 "WINDOW"
	                 "WITH"
	                 "WORDS"
	                 "WORKING-STORAGE"
	                 "WRAP"
	                 "WRITE"
	                 "WRITE-ONLY"
	                 "WRITE-VERIFY"
	                 "WRITERS"
	                 "X"
	                 "XML"
	                 "XML-DECLARATION"
	                 "Y"
	                 "YYYYDDD"
	                 "YYYYMMDD"
	                 "ZERO"
	                 "ZERO-FILL"
	                 "ZEROES"
	                 "ZEROS"))

(defvar instrinsic-words '("ABS"
	                   "ACOS"
	                   "ANNUITY"
	                   "ASIN"
	                   "ATAN"
	                   "BOOLEAN-OF-INTEGER"
	                   "BYTE-LENGTH"
	                   "CHAR"
	                   "CHAR-NATIONAL"
	                   "COMBINED-DATETIME"
	                   "CONCAT"
	                   "CONCATENATE"
	                   "CONTENT-LENGTH"
	                   "CONTENT-OF"
	                   "COS"
	                   "CURRENCY-SYMBOL"
	                   "CURRENT-DATE"
	                   "DATE-OF-INTEGER"
	                   "DATE-TO-YYYYMMDD"
	                   "DAY-OF-INTEGER"
	                   "DAY-TO-YYYYDDD"
	                   "DISPLAY-OF"
	                   "E"
	                   "EXCEPTION-FILE"
	                   "EXCEPTION-FILE-N"
	                   "EXCEPTION-LOCATION"
	                   "EXCEPTION-LOCATION-N"
	                   "EXCEPTION-STATEMENT"
	                   "EXCEPTION-STATUS"
	                   "EXP"
	                   "EXP10"
	                   "FACTORIAL"
	                   "FORMATTED-CURRENT-DATE"
	                   "FORMATTED-DATE"
	                   "FORMATTED-DATETIME"
	                   "FORMATTED-TIME"
	                   "FRACTION-PART"
	                   "HIGHEST-ALGEBRAIC"
	                   "INTEGER"
	                   "INTEGER-OF-BOOLEAN"
	                   "INTEGER-OF-DATE"
	                   "INTEGER-OF-DAY"
	                   "INTEGER-OF-FORMATTED-DATE"
	                   "INTEGER-PART"
	                   "LENGTH"
	                   "LENGTH-AN"
	                   "LOCALE-COMPARE"
	                   "LOCALE-DATE"
	                   "LOCALE-TIME"
	                   "LOCALE-TIME-FROM-SECONDS"
	                   "LOG"
	                   "LOG10"
	                   "LOWER-CASE"
	                   "LOWEST-ALGEBRAIC"
	                   "MAX"
	                   "MEAN"
	                   "MEDIAN"
	                   "MIDRANGE"
	                   "MIN"
	                   "MOD"
	                   "MODULE-CALLER-ID"
	                   "MODULE-DATE"
	                   "MODULE-FORMATTED-DATE"
	                   "MODULE-ID"
	                   "MODULE-PATH"
	                   "MODULE-SOURCE"
	                   "MODULE-TIME"
	                   "MONETARY-DECIMAL-POINT"
	                   "MONETARY-THOUSANDS-SEPARATOR"
	                   "NATIONAL-OF"
	                   "NUMERIC-DECIMAL-POINT"
	                   "NUMERIC-THOUSANDS-SEPARATOR"
	                   "NUMVAL"
	                   "NUMVAL-C"
	                   "NUMVAL-F"
	                   "ORD"
	                   "ORD-MAX"
	                   "ORD-MIN"
	                   "PI"
	                   "PRESENT-VALUE"
	                   "RANDOM"
	                   "RANGE"
	                   "REM"
	                   "REVERSE"
	                   "SECONDS-FROM-FORMATTED-TIME"
	                   "SECONDS-PAST-MIDNIGHT"
	                   "SIGN"
	                   "SIN"
	                   "SQRT"
	                   "STANDARD-COMPARE"
	                   "STANDARD-DEVIATION"
	                   "STORED-CHAR-LENGTH"
	                   "SUBSTITUTE"
	                   "SUBSTITUTE-CASE"
	                   "SUM"
	                   "TAN"
	                   "TEST-DATE-YYYYMMDD"
	                   "TEST-DAY-YYYYDDD"
	                   "TEST-FORMATTED-DATETIME"
	                   "TEST-NUMVAL"
	                   "TEST-NUMVAL-C"
	                   "TEST-NUMVAL-F"
	                   "TRIM"
	                   "UPPER-CASE"
	                   "VARIANCE"
	                   "WHEN-COMPILED"
	                   "YEAR-TO-YYYY"))

(defvar mnemonics-words '("SYSIPT"
	                  "STDIN"
	                  "SYSOUT"
	                  "SYSLIST"
	                  "SYSLST"
	                  "SYSPCH"
	                  "SYSPUNCH"
	                  "STDOUT"
	                  "PRINT"
	                  "PRINTER"
	                  "PRINTER-1"
	                  "SYSERR"
	                  "STDERR"
	                  "CONSOLE"
	                  "C01"
	                  "C02"
	                  "C03"
	                  "C04"
	                  "C05"
	                  "C06"
	                  "C07"
	                  "C08"
	                  "C09"
	                  "C10"
	                  "C11"
	                  "C12"
	                  "S01"
	                  "S02"
	                  "S03"
	                  "S04"
	                  "S05"
	                  "CSP"
	                  "FORMFEED"
	                  "TOP"
	                  "CALL-CONVENTION"
	                  "SWITCH-0"
	                  "SWITCH-1"
	                  "SWITCH-2"
	                  "SWITCH-3"
	                  "SWITCH-4"
	                  "SWITCH-5"
	                  "SWITCH-6"
	                  "SWITCH-7"
	                  "SWITCH-8"
	                  "SWITCH-9"
	                  "SWITCH-10"
	                  "SWITCH-11"
	                  "SWITCH-12"
	                  "SWITCH-13"
	                  "SWITCH-14"
	                  "SWITCH-15"
	                  "SWITCH-16"
	                  "SWITCH-17"
	                  "SWITCH-18"
	                  "SWITCH-19"
	                  "SWITCH-20"
	                  "SWITCH-21"
	                  "SWITCH-22"
	                  "SWITCH-23"
	                  "SWITCH-24"
	                  "SWITCH-25"
	                  "SWITCH-26"
	                  "SWITCH-27"
	                  "SWITCH-28"
	                  "SWITCH-29"
	                  "SWITCH-30"
	                  "SWITCH-31"
	                  "SWITCH-32"
	                  "SWITCH-33"
	                  "SWITCH-34"
	                  "SWITCH-35"
	                  "SWITCH-36"))

(defvar system-words '("SYSTEM"
	               "CBL_AND"
	               "CBL_ALARM_SOUND"
	               "CBL_BELL_SOUND"
	               "CBL_CHANGE_DIR"
	               "CBL_CHECK_FILE_EXIST"
	               "CBL_CLOSE_FILE"
	               "CBL_COPY_FILE"
	               "CBL_CREATE_DIR"
	               "CBL_CREATE_FILE"
	               "CBL_DELETE_DIR"
	               "CBL_DELETE_FILE"
	               "CBL_EQ"
	               "CBL_ERROR_PROC"
	               "CBL_EXIT_PROC"
	               "CBL_FLUSH_FILE"
	               "CBL_GET_CSR_POS"
	               "CBL_GET_CURRENT_DIR"
	               "CBL_GET_SCR_SIZE"
	               "CBL_IMP"
	               "CBL_NIMP"
	               "CBL_NOR"
	               "CBL_NOT"
	               "CBL_OPEN_FILE"
	               "CBL_OR"
	               "CBL_READ_FILE"
	               "CBL_READ_KBD_CHAR"
	               "CBL_RENAME_FILE"
	               "CBL_SET_CSR_POS"
	               "CBL_TOLOWER"
	               "CBL_TOUPPER"
	               "CBL_WRITE_FILE"
	               "CBL_XOR"
	               "CBL_GC_FORK"
	               "CBL_GC_GETOPT"
	               "CBL_GC_HOSTED"
	               "CBL_GC_NANOSLEEP"
	               "CBL_GC_PRINTABLE"
	               "CBL_GC_WAITPID"
	               "CBL_OC_GETOPT"
	               "CBL_OC_HOSTED"
	               "CBL_OC_NANOSLEEP"
	               "C$CALLEDBY"
	               "C$CHDIR"
	               "C$COPY"
	               "C$DELETE"
	               "C$FILEINFO"
	               "C$GETPID"
	               "C$JUSTIFY"
	               "C$MAKEDIR"
	               "C$NARG"
	               "C$PARAMSIZE"
	               "C$PRINTABLE"
	               "C$SLEEP"
	               "C$TOLOWER"
	               "C$TOUPPER"
	               "EXTFH"))

;; generate regex string for each category of keywords
;; should this be setq ?wierd.
(setq gnucobol-reserved-words-regexp (regexp-opt reserved-words 'words))
(setq gnucobol-intrinsict-words-regexp (regexp-opt instrinsic-words 'words))
(setq gnucobol-mnemonics-words-regexp (regexp-opt mnemonics-words 'words))
(setq gnucobol-system-words-regexp (regexp-opt system-words 'words))

(setq gnucobol-font-lock-keywords
      `(
        (,gnucobol-reserved-words-regexp . font-lock-type-face)
        (,gnucobol-intrinsict-words-regexp . font-lock-constant-face)
        (,gnucobol-mnemonics-words-regexp . font-lock-builtin-face)
        (,gnucobol-system-words-regexp . font-lock-function-name-face)
        ;; in general, longer words first
        ))


(defvar gnucobol-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)  map)  "Keymap for GNUCOBOL major mode.")

(defvar gnucobol-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?-  "w"   st)
    (modify-syntax-entry ?_  "w"   st)
    (modify-syntax-entry ?*  ". 1" st)
    (modify-syntax-entry ?>  "w 2" st)
    (modify-syntax-entry ?\\ "."   st)
    (modify-syntax-entry ?'  "\""  st)
    (modify-syntax-entry ?\" "\""  st)
    (modify-syntax-entry ?\n ">"   st) st))

(define-derived-mode gnucobol-mode prog-mode "GNUCOBOL"
  "COBOL mode is a major mode for handling COBOL files."
  :group 'gnucobol

  ;; basic syntax table.
  (set-syntax-table gnucobol-mode-syntax-table)

  ;; syntax highlighting
  (setq font-lock-defaults '((gnucobol-font-lock-keywords)))

  ;; always display line numbers.
  (setq display-line-numbers t)

  (set (make-local-variable 'comment-start-skip) "\\(^.\\{6\\}\\*\\|\\*>\\)\\s-* *")
  (set (make-local-variable 'comment-start) "*>")
  (set (make-local-variable 'comment-end) "")

  (set (make-local-variable 'column-number-mode) t)

  ;; Auto complete mode
  (set (make-local-variable 'ac-ignore-case) t))

;;; gnucobol-mode.el ends here


