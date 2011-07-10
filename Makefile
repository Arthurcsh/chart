include $(GOROOT)/src/Make.inc

TARG=github.com/vdobler/chart
GOFILES=\
	chart.go\
	util.go\
	stat.go\
	time.go\
	text.go\
	strip.go\
	scatter.go\
	box.go\
	hist.go\
	bar.go

include $(GOROOT)/src/Make.pkg

chart.$(O): $(GOFILES)
	$(GC) -o chart.$(O) $^

samplechart: samplecharts.go chart.$(O)
	$(GC) -I. samplecharts.go
	$(LD) -L. -o samplecharts samplecharts.$(O)

format: $(GOFILES) samplecharts.go  
	gofmt -w $^