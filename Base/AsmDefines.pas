unit AsmDefines;
interface

const
 // ��������� ��� ������
 hasModRM = 1;
 hasSIB = 2;
 hasOffset8 = 4;
 hasOffset32 = 8;
 hasValue8 = 16;
 hasValue16 = 32;
 hasvalue32 = 64;
 hasValueOffset = hasOffset8+hasOffset32+hasValue8+hasValue16+hasValue32;
 canPack    = 128; // ���� �������� ����� ��������� �� �����

const
 // ������ ��� ���������� ����������� � ���� ��� ������������
 fillers:array[1..15,0..15] of byte=(
   ($90,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00),  // 1
   ($09,$C0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00),  // 2
   ($80,$F3,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00),  // 3
   ($80,$F3,$00,$90,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00),  // 4
   ($0D,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00),  // 5
   ($81,$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00),  // 6
   ($81,$CB,$00,$00,$00,$00,$90,$00,$00,$00,$00,$00,$00,$00,$00,$00),  // 7
   ($81,$CB,$00,$00,$00,$00,$09,$C0,$00,$00,$00,$00,$00,$00,$00,$00),  // 8
   ($81,$CB,$00,$00,$00,$00,$80,$F3,$00,$00,$00,$00,$00,$00,$00,$00),  // 9
   ($0D,$00,$00,$00,$00,$0D,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00),  // 10
   ($0D,$00,$00,$00,$00,$81,$CB,$00,$00,$00,$00,$00,$00,$00,$00,$00),  // 11
   ($81,$CB,$00,$00,$00,$00,$81,$CB,$00,$00,$00,$00,$00,$00,$00,$00),  // 12
   ($81,$CB,$00,$00,$00,$00,$0D,$00,$00,$00,$00,$09,$C0,$00,$00,$00),  // 13
   ($81,$CB,$00,$00,$00,$00,$09,$C0,$81,$CB,$00,$00,$00,$00,$00,$00),  // 14
   ($81,$CB,$00,$00,$00,$00,$80,$F3,$00,$81,$CB,$00,$00,$00,$00,$00)); // 15

type
 // ������ ��� �������
 TStatement=packed record
  offset:cardinal; // ��������� ����� (��������)
  alignment:byte;  // ��� ����������� (�������� 0,1,2,4,8 ��� 16)
  case kind:byte of      // 0 - �������, 1 - ����������
  0:(
    size:byte;    // ������ �������
    prefCount:byte; // ���-�� ���������
    prefixes:array[0..3] of byte; // ��������
    opcode:byte;  // ����� �������
    flags:byte;   // ����� ������� ���. �����
    modRM:byte;   // ���� Mod/RM
    sib:byte;     // ���� Scale-Index-Base
    offsetValue:integer; // �������� �������� ������
    value:integer;       // ���������������� �������
    lab:smallint;        // ����� ����� (���� ������������, �����: -1)
    labFor:byte;         // ��� ������������ �����: 1 - ��� offset, 2 - ��� value
    labcode:byte;        // �������������� opcode (�� ������ �������� ��������)
  );
  1:(
    fullsize:word;     // ������ ������
    typesize:byte;     // ������ ������ �������� (��� ��������)
    init:boolean;      // true ���� ��������� �������������
    initValue:array[0..9] of byte; // �������� ��� �������������
  );
 end;

 TLabel=record
  relative:boolean; // true, ���� ��� ����� statement'�.
  defined:boolean; // true ���� ����� ��� ��������
  value:cardinal; // ����� statement'� ���� ���������� �����
 end;

implementation

end.
