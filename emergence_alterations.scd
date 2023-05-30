//

(
//overlagring n-times -> remove
var path = "/Volumes/DATABSE M/MIDI/emergence/originals/old1.mid";
var file = SimpleMIDIFile.read(path);
3.do{
	var new = SimpleMIDIFile.read(path);
	// new.transpose(24,0.5);
	new.timeStretch(rrand(0.8,1.2));
	if(0.5.coin, {new.inverse(rrand(50,80))});

	file.superimpose([new]);
};
file.removeEvents(0.9);
file.removeAboveBelow(21,108);
file.converted.size.postln;

file.write("/Volumes/DATABSE M/MIDI/emergence/altered/temp.mid");
)

()


(
//remove
var path = "/Volumes/DATABSE M/MIDI/emergence/altered/old1_sliceCat_combined1.MID";
var file = SimpleMIDIFile.read(path);
file.removeEvents(0.4 );
file.removeSlowerFaster(100,0.01);
file.write("/Volumes/DATABSE M/MIDI/emergence/altered/old1_sliceCat_combined1_rmv1.mid");
)

(
//slice -> cat n-times with processing
var path = "/Volumes/DATABSE M/MIDI/emergence/originals/i4.mid";
var file = SimpleMIDIFile.read(path);
var ts = Array.fill(50,{rrand(0.7,1.2)});
var idx = 0;
var sliceSize = 0.05;
var slicePos = rrand(0.2,0.8);
var transPos = 0;
var stretchPos = 0.5;
file.slice(slicePos-(sliceSize/2), slicePos+(sliceSize/2));
ts.do{|factor|
	var new = SimpleMIDIFile.read(path);
	var meanNotes = new.notes.mean;

	new.slice(slicePos-(sliceSize/2), slicePos+(sliceSize/2));
	new.timeStretch([1.0,0.8,0.6,1.2,1.4].choose);
	new.transpose([-5,-7,5,7].choose);
	new.removeEvents(rrand(0.0,0.0));
	new.removeSlowerFaster(100,0.01);

	if(0.5.coin, {new.inverse(meanNotes)});
	file.cat([new], 0);

	slicePos = slicePos + rrand(-0.1,0.1);
	transPos = transPos + rrand(-2,2);
	stretchPos = stretchPos + rrand(-0.0,0.0);
	if(stretchPos < 0.5, {stretchPos = 1.0});
};

file.removeAboveBelow(21,108);
file.write("/Volumes/DATABSE M/MIDI/emergence/altered/temp.mid");
)








(
var src = SimpleMIDIFile.read("/Users/martin/Documents/MIDI/supercollider/korall1.MID");
var out = SimpleMIDIFile.new;

2.do{
	var new = SimpleMIDIFile.copy(src);
	new.slice(rrand(0.1,0.3),rrand(0.5,0.9));
	new.transpose(rrand(-12,12));
	out.cat([new]);
};

out.write("/Users/martin/Documents/MIDI/supercollider/catTest1.mid");
)