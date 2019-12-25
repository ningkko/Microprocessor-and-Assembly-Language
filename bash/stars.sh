# This bash program outputs the following image
# *     *
# **    *
# ***   *
# ****  *
# ***** *
# *******
# ***** *
# ****  *
# ***   *
# **    *
# *     *


for i in 1 2 3 4 5 6; do
    for a in `seq 1 $i` ; do
	echo -n "*"
    done

    for b in `seq $i 5`; do
	echo -n " "
    done
    echo "*"
done

for j in 5 4 3 2 1 ; do
    for c in `seq 1 $j` ; do
        echo -n "*"
    done

    for d in `seq $j 5`; do
        echo -n " "
    done
    echo "*"
done
