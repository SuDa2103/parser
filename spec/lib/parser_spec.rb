require_relative '../spec_helper'
require_relative '../../parser2.rb'

RSpec.describe Parser do
  test_parser = Parser.new('/Users/sunnydasgupta/code/SuDa2103/parser/spec/data/test_data.log')

  describe '#parse' do
    let(:expected_results) do
      {
        '/help_page/1'   => ["126.318.035.038", "929.398.951.889", "722.247.931.582", "646.865.545.408", "126.318.035.038"],
        '/contact' => ["184.123.665.067", "184.123.665.067"],
        '/home'   => ["184.123.665.067", "235.313.352.950"],
        '/about/2' => ["444.701.448.104"],
        '/index'    => ["444.701.448.104"],
        '/about'    => ["061.945.150.735"]
      }
    end

    it 'parses a logfile and stores all the lines in a hash called entries' do
      expect(test_parser.parse).to eq(expected_results)
    end
  end

  describe '#most_page_views' do
    let(:expected_results) do
      {
        '/help_page/1' => [5],
        '/home'    => [2],
        '/contact' => [2],
        '/about'   => [1],
        '/index' => [1],
        '/about/2' => [1]
      }
    end

      it 'returns a hash where pages are orderd by number of views' do
        expect(test_parser.most_page_views).to eq(expected_results)
      end
  end

  describe '#unique_page_views' do
    let(:expected_results) do
      {
        '/help_page/1' => [4],
        '/home'    => [2],
        '/index'   => [1],
        '/contact' => [1],
        '/about'   => [1],
        '/about/2' => [1]
      }
    end
    it 'returns a hash where pages are ordered by the number of unique views' do
      expect(test_parser.unique_page_views).to eq(expected_results)
    end
  end
end
