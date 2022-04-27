# Welcome to Sonic Pi

define :twinkle do
  # 1: Twinkle twinkle little star
  play 60
  play 55
  sleep 0.5
  play 60
  play 55
  sleep 0.5
  play 64
  play 67
  sleep 0.5
  play 64
  play 67
  sleep 0.5
  play 65
  play 69
  sleep 0.5
  play 65
  play 69
  sleep 0.5
  play 64
  play 67
  sleep 1
  
  # 2: How I wonder what you are
  play 65
  play 62
  sleep 0.5
  play 65
  play 62
  sleep 0.5
  play 64
  play 60
  sleep 0.5
  play 64
  play 60
  sleep 0.5
  play 62
  play 55
  sleep 0.5
  play 62
  play 55
  sleep 0.5
  play 60
  play 55
  play 52
  sleep 1
end

define :upabove do
  # 3: Up above the world so high
  # Like a diamond in the sky
  
  play 67
  play 64
  sleep 0.5
  play 67
  play 64
  sleep 0.5
  play 65
  play 62
  sleep 0.5
  play 65
  play 62
  sleep 0.5
  play 64
  play 60
  sleep 0.5
  play 64
  play 60
  sleep 0.5
  play 62
  play 55
  sleep 0.5
end

# Setup
use_bpm 120
use_synth :pulse

# Song

##| twinkle

##| 2.times do
##|   upabove
##| end

##| twinkle

twinkle
2.times do
  upabove
end
twinkle
