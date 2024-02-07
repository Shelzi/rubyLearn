# frozen_string_literal: true

class FileUtils
  def self.write_file(file_name, content = nil) # rubocop:disable Metrics/MethodLength
    File.open(file_name, 'w') do |f|
      if content.nil?
        f.write('In the bustling streets of Akihabara, Rintarou Okabe, the self-proclaimed mad scientist, found himself entangled in a web of temporal anomalies once again. The air crackled with an otherworldly energy as Okabe, accompanied by his quirky companions, delved into the mysteries of time travel using their makeshift invention, the \\"PhoneWave (name subject to change).\\"
        The Future Gadget Laboratory, adorned with chaotic stacks of gadgets and scientific instruments, served as the epicenter of their experiments. Okabe, donned in his iconic lab coat and eccentric demeanor, stared at the humming device with a mix of excitement and trepidation. The digital display flickered with cryptic symbols, hinting at the possibilities that lay beyond the fabric of reality.
        As the group initiated the experiment, the room pulsated with an ethereal glow, and the familiar hum of the PhoneWave echoed through the lab. The atmosphere became charged with anticipation as the group awaited the outcome of their latest venture into the uncharted territory of time manipulation.
        Suddenly, the room seemed to warp and twist, casting everyone into an alternate timeline. A hush fell over the laboratory as the once-familiar surroundings morphed into an unfamiliar, dystopian version of Akihabara. The buildings stood in disrepair, and an eerie silence gripped the air.
        Okabe, with a furrowed brow, realized that their experiment had inadvertently unleashed unforeseen consequences. The timeline had diverged, and the group now faced the challenge of navigating this new reality. The remnants of a once-vibrant district now told a tale of a world gone awry.
        Determined to set things right, Okabe, along with Kurisu Makise, the brilliant scientist, and the rest of the lab members, embarked on a journey through the temporal labyrinth. The enigma of the divergence drew them into a race against time itself, as they sought to repair the fabric of reality and restore Akihabara to its former glory.
        The group encountered alternate versions of themselves, each representing a different path in the tangled web of timelines. Emotions ran high as Okabe confronted the consequences of tampering with the natural order, grappling with the ethical implications of their scientific pursuits.
        The journey through the alternate Akihabara brought forth unexpected alliances and heartbreaking revelations. Friendships were tested, and loyalties were challenged, as the group navigated the intricacies of the multiverse. The lines between cause and effect blurred, and Okabe found himself questioning the very nature of free will in a world shaped by the delicate threads of time. As the group stood on the precipice of unraveling the mystery, a haunting truth loomed over them—the consequences of their actions reverberated not only through the past and present but also into an uncertain future. The fate of Akihabara and the lives of its inhabitants rested in the hands of the time-traveling misfits, as they grappled with the paradoxes that defined their existence.')
      else
        f.write(content)
      end
    end
  end

  def self.read_file_by_lines(file_name)
    File.open(file_name, 'r').readlines
  end
end
