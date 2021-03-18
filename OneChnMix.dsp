import ("stdfaust.lib");

process = hgroup("OneChnMix", mute : *(gain) : pan);

mute = *(1-checkbox("mute"));
// amplify = +(hslider("gain[style:knob]",0,-4,1,0.01));
gain = vslider("Gain[style:knob]", 0, -40, +10, 0.1) : ba.db2linear : si.smoo;

pan = _ <: *(1-p),*(p)
with{
    p = nentry("Pan[style:knob]", 0.5,0,1,0.01);
};
