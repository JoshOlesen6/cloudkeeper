require 'spec_helper'

describe Cloudkeeper::CommandExecutioner do
  subject(:command_executioner) { described_class }

  let(:command) { instance_spy(Mixlib::ShellOut) }

  before do
    allow(command).to receive(:error?).and_return(false)
    allow(command).to receive(:stdout).and_return('output')
    Cloudkeeper::Settings[:'external-tools-execution-timeout'] = 123
  end

  describe '#execute' do
    before do
      allow(Mixlib::ShellOut).to receive(:new).with('arg1', 'arg2', 'arg3', timeout: 123) { command }
    end

    context 'with successful run' do
      it 'executes external command and returns standard output' do
        expect(command_executioner.execute('arg1', 'arg2', 'arg3')).to eq('output')
      end
    end

    context 'with error' do
      before do
        allow(command).to receive(:error?).and_return(true)
      end

      it 'executes command and raises CommandExecutionError exception' do
        expect { command_executioner.execute('arg1', 'arg2', 'arg3') }.to raise_error(Cloudkeeper::Errors::CommandExecutionError)
      end
    end
  end

  describe '#list_archive' do
    let(:archive) { instance_double('archive') }

    before do
      allow(Mixlib::ShellOut).to receive(:new).with('tar', '-t', '-f', archive, timeout: 123) { command }
      allow(command).to receive(:stdout).and_return("image.ovf\nimage.vmdk\nimage.mf\n")
    end

    it 'calls the right command to list content of the archive' do
      expect(command_executioner.list_archive(archive)).to eq(['image.ovf', 'image.vmdk', 'image.mf'])
    end
  end
end
