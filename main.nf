params.id = 'sampleId'
params.meta = 'metadata'
params.test = "${baseDir}/data/test.txt"
params.reads = "${baseDir}/data/reads.txt"

include { SUBWORKFLOW_TEST } from "./subworkflows/main.nf"

workflow{
 SUBWORKFLOW_TEST(channel.of(params.id), channel.of([params.meta,file(params.test)]), channel.of(file(params.reads))).out.view()
}
