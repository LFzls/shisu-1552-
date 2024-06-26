.export stkptr
stkptr = $0020
.export __STKPTRSAVESIZE__ ;0
__STKPTRSAVESIZE__ = 0
.export _fpruntimestack
_fpruntimestack = $0288
.export RSR, __BANK1_OFFSET_VALUE__,__OPXSTKPTRSIZE__
RSR = $FFFFFFFF
__OPXSTKPTRSIZE__ = 0 ;stkptr=0, tmp1size=0
__BANK1_OFFSET_VALUE__ = $00A0
.export __FPLANE_ADDRESS_MAX__,__RPLANE_ADDRESS_MAX__
__FPLANE_ADDRESS_MAX__ = $007F
__RPLANE_ADDRESS_MAX__ = $0000
.AutoImport	on
.export stkptr
stkptr = $0020
.export __STKPTRSAVESIZE__ ;0
__STKPTRSAVESIZE__ = 0
.export _fpruntimestack
_fpruntimestack = $0288
.export RSR, __BANK1_OFFSET_VALUE__,__OPXSTKPTRSIZE__
RSR = $FFFFFFFF
__OPXSTKPTRSIZE__ = 0 ;stkptr=0, tmp1size=0
__BANK1_OFFSET_VALUE__ = $00A0
.export __FPLANE_ADDRESS_MAX__,__RPLANE_ADDRESS_MAX__
__FPLANE_ADDRESS_MAX__ = $007F
__RPLANE_ADDRESS_MAX__ = $0000
.AutoImport	on
