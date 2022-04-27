set_volume! 0.5
use_bpm 60

# This piece uses a chord progression of 4 chords

key = :A
key_tonic = :major

# The chord progression should be 4 numbers that are between 1 and 7.
# The number represents the degree of the chord in the key.
# The chord progression is the foundation of harmony in the piece.
# This allows different instruments to play together in harmony.
chord_progression = [1, 3, 6, 4]

# You could also try a different chord progression like:
#chord_progression = [1, 6, 2, 5]


in_thread do
  with_synth :beep do
    with_octave -2 do
      loop do
        chord_progression.each do |degree|
          # An inversion lets us change the 'voice' of a chord.
          inversion = [1, 2, 3].choose
          num_notes = 4
          
          current_chord = chord_degree degree, key, key_tonic, num_notes, invert: inversion
          
          play_pattern_timed current_chord, 0.25, amp: 0.25
          
          sleep 0.25
        end
      end
    end
  end
end

sleep 5

in_thread do
  with_synth :blade do
    with_octave -1 do
      loop do
        chord_progression.each do |degree|
          inversion = [1, 2, 3].choose
          num_notes = 4
          
          current_chord = chord_degree degree, key, key_tonic, num_notes, invert: inversion
          
          play_chord current_chord, amp: 0.5, attack: 0.2, sustain: 0.8, release: 0.8, vibrato_depth: 0.2, vibrato_onset: 0.3
          
          sleep 1.25
        end
      end
    end
  end
end

sleep 5

in_thread do
  # 1 - major
  # 2 - minor
  # 3 - minor
  # 4 - major
  # 5 - major
  # 6 - minor
  # 7 - minor
  scales = [
    (scale (degree chord_progression[0], key, key_tonic), :major_pentatonic),
    (scale (degree chord_progression[1], key, key_tonic), :minor_pentatonic),
    (scale (degree chord_progression[2], key, key_tonic), :minor_pentatonic),
    (scale (degree chord_progression[3], key, key_tonic), :major_pentatonic),
  ]
  times = [
    0.25,
    0.5,
    0.5,
  ]
  num_notes = 5
  
  with_synth :pretty_bell do
    loop do
      scales.each do |scale|
        play_pattern_timed scale.shuffle.take(num_notes), times.shuffle, amp: 0.15
      end
    end
  end
end

in_thread do
  with_synth :noise do
    loop do
      play :C3, amp: 0.1, attack: 1.0, sustain: 0.5, release: 2.0, pan: rrand(-0.75, 0.75)
      
      sleep 5
    end
  end
end