#!/usr/bin/env ruby

require_relative "policy_ocr"
require_relative "ocr_digits"

require 'optparse'

options = {
  include_status: false,
  output_path: "findings.txt"
}

OptionParser.new do |opts|
  opts.banner = "Usage: ocr_parser.rb [options] FILE"

  opts.on("--with-status", "Include status in output and write to file") do
    options[:include_status] = true
  end
end.parse!

if ARGV.empty?
  puts "Error: Please provide the path to the OCR input file."
  exit 1
end

input_file = ARGV.first

output = PolicyOcr.parse_file(file: input_file, include_status: options[:include_status])

if options[:include_status]
  File.open(options[:output_path], "w") do |f|
    output.each { |line| f.puts(line) }
  end
else
  puts output.join("\n")
end
