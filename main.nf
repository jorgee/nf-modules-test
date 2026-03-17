params.id = 'sampleId'
params.meta = 'metadata'
params.test = "${baseDir}/data/test.txt"
params.reads = "${baseDir}/data/reads.txt"

include { SUBWORKFLOW_TEST } from "./subworkflows/main.nf"
include { TEST } from "test/my-test-module"

workflow{
 reads = channel.of(file(params.reads))
 test = channel.of([params.meta,file(params.test)])
 result = SUBWORKFLOW_TEST(channel.of(params.id), test, reads)
 TEST(result.id, test, reads).txt.view()
}
