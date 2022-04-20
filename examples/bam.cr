require "../src/hts"

bam_path = File.expand_path("../../test/fixtures/poo.sort.bam", __FILE__)

HTS::Bam.open(bam_path) do |b|
  b.each do |r|
    p name: r.qname,
      flag: r.flag.value,
      pos: r.pos + 1,
      mpos: r.mpos + 1,
      mqual: r.mapq,
      seq: r.seq,
      cigar: r.cigar,
      qual: r.qual.map { |i| (i + 33).chr }.join
  end
end
