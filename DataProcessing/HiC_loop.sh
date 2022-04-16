dir=/work3/WANG_cohesinDB/Curated/target/HiC/Needfastq/
juicer=~/software/juicer/juicer_tools_1.11.04_jcuda.0.8.jar

for i in `ls $dir`
do
	echo $i
	for name in `ls $dir/$i/JuicerResults/`
	do
		echo $name
		file=$dir/$i/JuicerResults/$name/aligned/inter_30.hic
		#java -Xms512m -Xmx200g -jar $juicer hiccups -r 25000 -k VC_SQRT $file $name --threads 12 --ignore_sparsity
	done
done	

dir2=/work3/WANG_cohesinDB/Curated/target/HiC/UsableHg38
for i in `ls $dir2 |sed 's/.hic//g'`
do
	echo $i
	name=$i
	file=$dir2/$i.hic
	java -Xms512m -Xmx200g -jar $juicer hiccups -r 25000 -k VC_SQRT $file $name --threads 12 --ignore_sparsity
done





