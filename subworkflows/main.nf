include { TEST } from "test/my-test-module"

workflow SUBWORKFLOW_TEST{
   take:
	id
	test
	reads
   main:
   	out_files = TEST(id, test, reads)
   emit:
	   id = out_files.id
	   out = out_files.txt
  
}
