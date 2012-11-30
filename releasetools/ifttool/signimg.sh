#!/bin/sh

sign() {

	IFT_ROOT=$(dirname "$0")/
	export LD_LIBRARY_PATH=${IFT_ROOT}ift/lib/lib_linux_32b:${LD_LIBRARY_PATH}

	IFT_CFG_DIR=${IFT_ROOT}reference/hs2.2/ref-config
	PPA_DIR=${IFT_ROOT}reference/hs2.2/ref-ppa

	${IFT_ROOT}ift/ift M -image -iswtype "MLO" -out $2 \
                                 -keycfg $IFT_CFG_DIR/key_m.cfg\
                                 -ppacfg $IFT_CFG_DIR/ppa_m.cfg\
                                 -iswcfg $IFT_CFG_DIR/isw_m.cfg\
                                 -isw $1\
                                 -ppa $PPA_DIR/ppa_ref.emu
}

get_sign() {
	cf1='CertISW'
	cf2='xyzabc'

	tmp=/tmp/zzz$$.0

	if	pos=`tr "$cf1\n$cf2" "\n$cf2=" < "$1" | grep -abo "^$cf2"`
	then
		pos=${pos%%:*}
		tail -c+$pos "$1" > $tmp 2> /dev/null
		if	[ $? != 1 ]
		then	# exit status must be 0 or 2 (trailing garbage warning)
			head -c848 $tmp
			rm $tmp
		fi
	fi
}

unpack() {
	unpackbootimg  -i $img -o $imgdir

	# set kernel and ramdisk
	kernel=$imgdir/*-zImage
	ramdisk=$imgdir/*-ramdisk.gz

	# wait a sec
	sleep 1
}


tmp1=/tmp/iftsign$$.1
tmp2=/tmp/iftsign$$.2
tmp3=/tmp/iftsign$$.3
tmp4=/tmp/iftsign$$.4

imgdir=/tmp/iftsign$$
mkdir $imgdir

img=$1

CMDLINE=
#CMDLINE="loglevel=8 console=null"
#CMDLINE="loglevel=8 console=ttyO3,115200n8"

OO=../ktmp
OO=../ktmp-ics

if [ -z "$img" ]; then
  echo IMAGE not specified
  exit 1
fi

echo "Unpacking..."
unpack

echo kernel: $kernel
echo ramdisk: $ramdisk
if [ ! -z CMDLINE ]; then
	echo "cmdline=$CMDLINE"
fi

echo "Signing..."
sign $kernel $tmp1 >/dev/null
sign $ramdisk $tmp2 >/dev/null

echo "Extract signing info..."
get_sign $tmp1 > $tmp3
get_sign $tmp2 > $tmp4
rm $tmp1 $tmp2

OPT='--base 0x80000000'

echo "Running mkimage $img..."
mkbootimg $OPT --cmdline "$CMDLINE" --kernel $kernel --ramdisk $ramdisk -o $img

cat $tmp3 >> $img
cat $tmp4 >> $img

# clean up
rm $tmp3 $tmp4
rm -rf $imgdir
