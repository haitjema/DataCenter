#
# OMNeT++/OMNEST Makefile for DataCenter
#
# This file was generated with the command:
#  opp_makemake -f --deep -I/opt/local/include -I../../inet/src/linklayer/ethernet -I../../inet/src/linklayer/ieee80211/radio -I../../inet/src/networklayer/common -I../../inet/src/networklayer/icmpv6 -I../../inet/src -I../../inet/src/world/obstacles -I../../inet/src/networklayer/xmipv6 -I../../inet/src/mobility -I../../inet/src/networklayer/contract -I../../inet/src/networklayer/manetrouting/base -I../../inet/src/networklayer/autorouting/ipv4 -I../../inet/src/linklayer/ieee80211/mgmt -I../../inet/src/util -I../../inet/src/transport/contract -I../../inet/src/linklayer/common -I../../inet/src/status -I../../inet/src/linklayer/radio/propagation -I../../inet/src/linklayer/ieee80211/radio/errormodel -I../../inet/src/linklayer/radio -I../../inet/src/util/headerserializers/tcp -I../../inet/src/networklayer/ipv4 -I../../inet/src/util/headerserializers/ipv4 -I../../inet/src/base -I../../inet/src/util/headerserializers -I../../inet/src/world/radio -I../../inet/src/linklayer/ieee80211/mac -I../../inet/src/networklayer/ipv6 -I../../inet/src/transport/sctp -I../../inet/src/util/headerserializers/udp -I../../inet/src/networklayer/ipv6tunneling -I../../inet/src/applications/pingapp -I../../inet/src/battery/models -I../../inet/src/util/headerserializers/sctp -I../../inet/src/linklayer/contract -I../../inet/src/networklayer/arp -I../../inet/src/transport/tcp_common -I../../inet/src/transport/udp -I../../inet/src/transport/tcp/queues -I../../inet/src/transport/tcp -I../../inet/src/applications/tcpapp -L/opt/local/lib -L../../inet/out/$(CONFIGNAME)/src -lboost_system-mt -lboost_filesystem-mt -linet -DINET_IMPORT -KINET_PROJ=../../inet
#

# Name of target to be created (-o option)
TARGET = DataCenter$(EXE_SUFFIX)

# User interface (uncomment one) (-u option)
USERIF_LIBS = $(ALL_ENV_LIBS) # that is, $(TKENV_LIBS) $(CMDENV_LIBS)
#USERIF_LIBS = $(CMDENV_LIBS)
#USERIF_LIBS = $(TKENV_LIBS)

# C++ include paths (with -I)
INCLUDE_PATH = \
    -I/opt/local/include \
    -I../../inet/src/linklayer/ethernet \
    -I../../inet/src/linklayer/ieee80211/radio \
    -I../../inet/src/networklayer/common \
    -I../../inet/src/networklayer/icmpv6 \
    -I../../inet/src \
    -I../../inet/src/world/obstacles \
    -I../../inet/src/networklayer/xmipv6 \
    -I../../inet/src/mobility \
    -I../../inet/src/networklayer/contract \
    -I../../inet/src/networklayer/manetrouting/base \
    -I../../inet/src/networklayer/autorouting/ipv4 \
    -I../../inet/src/linklayer/ieee80211/mgmt \
    -I../../inet/src/util \
    -I../../inet/src/transport/contract \
    -I../../inet/src/linklayer/common \
    -I../../inet/src/status \
    -I../../inet/src/linklayer/radio/propagation \
    -I../../inet/src/linklayer/ieee80211/radio/errormodel \
    -I../../inet/src/linklayer/radio \
    -I../../inet/src/util/headerserializers/tcp \
    -I../../inet/src/networklayer/ipv4 \
    -I../../inet/src/util/headerserializers/ipv4 \
    -I../../inet/src/base \
    -I../../inet/src/util/headerserializers \
    -I../../inet/src/world/radio \
    -I../../inet/src/linklayer/ieee80211/mac \
    -I../../inet/src/networklayer/ipv6 \
    -I../../inet/src/transport/sctp \
    -I../../inet/src/util/headerserializers/udp \
    -I../../inet/src/networklayer/ipv6tunneling \
    -I../../inet/src/applications/pingapp \
    -I../../inet/src/battery/models \
    -I../../inet/src/util/headerserializers/sctp \
    -I../../inet/src/linklayer/contract \
    -I../../inet/src/networklayer/arp \
    -I../../inet/src/transport/tcp_common \
    -I../../inet/src/transport/udp \
    -I../../inet/src/transport/tcp/queues \
    -I../../inet/src/transport/tcp \
    -I../../inet/src/applications/tcpapp \
    -I. \
    -Imodel \
    -Imodel/common \
    -Imodel/link \
    -Imodel/networks \
    -Imodel/networks/fattree \
    -Imodel/networks/fattree/generatedOutsideOmnet \
    -Imodel/networks/fattree/iterative \
    -Imodel/networks/fattree/recursive \
    -Imodel/networks/testNetworks \
    -Imodel/node \
    -Imodel/node/applicationLayer \
    -Imodel/node/applicationLayer/BklgSchedApplication \
    -Imodel/node/applicationLayer/TCPMessageApplication \
    -Imodel/node/applicationLayer/messageApplication \
    -Imodel/node/applicationLayer/messageApplication/trafficPatterns \
    -Imodel/node/applicationLayer/resequencingTestSource \
    -Imodel/node/applicationLayer/trafficSourceApplication \
    -Imodel/node/control \
    -Imodel/node/linkLayer \
    -Imodel/node/networkLayer \
    -Imodel/node/resequencingLayer \
    -Imodel/node/resequencingLayer/test \
    -Imodel/node/schedulingLayer \
    -Imodel/node/schedulingLayer/proxy \
    -Imodel/node/schedulingLayer/schedFromFile \
    -Imodel/node/server \
    -Imodel/node/transportLayer \
    -Imodel/packets \
    -Imodel/switch

# Additional object and library files to link with
EXTRA_OBJS =

# Additional libraries (-L, -l options)
LIBS = -L/opt/local/lib -L../../inet/out/$(CONFIGNAME)/src  -lboost_system-mt -lboost_filesystem-mt -linet
LIBS += -Wl,-rpath,`abspath /opt/local/lib` -Wl,-rpath,`abspath ../../inet/out/$(CONFIGNAME)/src`

# Output directory
PROJECT_OUTPUT_DIR = ../out
PROJECTRELATIVE_PATH = src
O = $(PROJECT_OUTPUT_DIR)/$(CONFIGNAME)/$(PROJECTRELATIVE_PATH)

# Object files for local .cc and .msg files
OBJS = \
    $O/model/common/BandwidthMeter.o \
    $O/model/common/DCCommon.o \
    $O/model/common/DCUtilities.o \
    $O/model/common/FatTreeNode.o \
    $O/model/common/L2Queue.o \
    $O/model/common/node_id.o \
    $O/model/common/PacketDropper.o \
    $O/model/common/ServerBuffer.o \
    $O/model/common/ServerStream.o \
    $O/model/common/set.o \
    $O/model/common/VirtualPacketQueue.o \
    $O/model/link/DCLink.o \
    $O/model/node/applicationLayer/BklgSchedApplication/BklgSchedApplication.o \
    $O/model/node/applicationLayer/BklgSchedApplication/ServerBacklog.o \
    $O/model/node/applicationLayer/TCPMessageApplication/TCPMessageApplication.o \
    $O/model/node/applicationLayer/messageApplication/ActiveMessage.o \
    $O/model/node/applicationLayer/messageApplication/AppMessage.o \
    $O/model/node/applicationLayer/messageApplication/MAAdjustQueueSizeToRate.o \
    $O/model/node/applicationLayer/messageApplication/MAAdjustRateToThreshold.o \
    $O/model/node/applicationLayer/messageApplication/MessageApplication.o \
    $O/model/node/applicationLayer/messageApplication/ScriptGenerator.o \
    $O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAll.o \
    $O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAllPartition.o \
    $O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAllVictimTenant.o \
    $O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_LBDestImbalance.o \
    $O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_PairedPermutation.o \
    $O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_PairedPodPermutation.o \
    $O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_Permutation.o \
    $O/model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.o \
    $O/model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPatternGenerator.o \
    $O/model/node/applicationLayer/resequencingTestSource/ResequencingTestSource.o \
    $O/model/node/applicationLayer/trafficSourceApplication/TrafficRegulator.o \
    $O/model/node/applicationLayer/trafficSourceApplication/TrafficSink.o \
    $O/model/node/applicationLayer/trafficSourceApplication/TrafficSource.o \
    $O/model/node/control/ControlLogic.o \
    $O/model/node/control/ModuleWithControlPort.o \
    $O/model/node/linkLayer/LoadBalancer.o \
    $O/model/node/linkLayer/MPLoadBalancer.o \
    $O/model/node/linkLayer/Path.o \
    $O/model/node/linkLayer/ServerPortQueue.o \
    $O/model/node/networkLayer/NetworkLayerBase.o \
    $O/model/node/networkLayer/VirtualIP.o \
    $O/model/node/resequencingLayer/HybridResequencer.o \
    $O/model/node/resequencingLayer/ResequencerBuffer.o \
    $O/model/node/resequencingLayer/SequenceNumberResequencer.o \
    $O/model/node/schedulingLayer/Demultiplexer.o \
    $O/model/node/schedulingLayer/Multiplexer.o \
    $O/model/node/schedulingLayer/SchedulingAlgorithm.o \
    $O/model/node/schedulingLayer/SchedulingController.o \
    $O/model/node/schedulingLayer/VirtualOutputQueue.o \
    $O/model/node/schedulingLayer/proxy/DistAlgProxy.o \
    $O/model/node/schedulingLayer/proxy/LinkProxy.o \
    $O/model/node/schedulingLayer/schedFromFile/ScheduleFromFile.o \
    $O/model/node/transportLayer/InetTCPConnectionWrapper.o \
    $O/model/node/transportLayer/InetTCPWrapper.o \
    $O/model/node/transportLayer/SimpleUDP.o \
    $O/model/packets/ControlMessage.o \
    $O/model/packets/DCN_EthPacket.o \
    $O/model/packets/DCN_IPPacket.o \
    $O/model/packets/DCN_TCPPacket.o \
    $O/model/packets/DCN_UDPPacket.o \
    $O/model/switch/ControlProcessor.o \
    $O/model/switch/SwitchPortQueue.o \
    $O/model/node/applicationLayer/messageApplication/UpdateQueueSizeMessage_m.o \
    $O/model/node/applicationLayer/messageApplication/UpdateSendingRateMessage_m.o \
    $O/model/node/applicationLayer/trafficSourceApplication/TrafficSourceControlMessage_m.o \
    $O/model/node/schedulingLayer/SchedulingMessage_m.o \
    $O/model/node/schedulingLayer/SchedulingPacket_m.o \
    $O/model/node/schedulingLayer/proxy/RequestPacket_m.o \
    $O/model/node/schedulingLayer/proxy/ResponsePacket_m.o \
    $O/model/packets/ControlMessage_m.o \
    $O/model/packets/DCN_EthPacket_m.o \
    $O/model/packets/DCN_IPPacket_m.o \
    $O/model/packets/DCN_TCPPacket_m.o \
    $O/model/packets/DCN_UDPPacket_m.o

# Message files
MSGFILES = \
    model/node/applicationLayer/messageApplication/UpdateQueueSizeMessage.msg \
    model/node/applicationLayer/messageApplication/UpdateSendingRateMessage.msg \
    model/node/applicationLayer/trafficSourceApplication/TrafficSourceControlMessage.msg \
    model/node/schedulingLayer/SchedulingMessage.msg \
    model/node/schedulingLayer/SchedulingPacket.msg \
    model/node/schedulingLayer/proxy/RequestPacket.msg \
    model/node/schedulingLayer/proxy/ResponsePacket.msg \
    model/packets/ControlMessage.msg \
    model/packets/DCN_EthPacket.msg \
    model/packets/DCN_IPPacket.msg \
    model/packets/DCN_TCPPacket.msg \
    model/packets/DCN_UDPPacket.msg

# Other makefile variables (-K)
INET_PROJ=../../inet

#------------------------------------------------------------------------------

# Pull in OMNeT++ configuration (Makefile.inc or configuser.vc)

ifneq ("$(OMNETPP_CONFIGFILE)","")
CONFIGFILE = $(OMNETPP_CONFIGFILE)
else
ifneq ("$(OMNETPP_ROOT)","")
CONFIGFILE = $(OMNETPP_ROOT)/Makefile.inc
else
CONFIGFILE = $(shell opp_configfilepath)
endif
endif

ifeq ("$(wildcard $(CONFIGFILE))","")
$(error Config file '$(CONFIGFILE)' does not exist -- add the OMNeT++ bin directory to the path so that opp_configfilepath can be found, or set the OMNETPP_CONFIGFILE variable to point to Makefile.inc)
endif

include $(CONFIGFILE)

# Simulation kernel and user interface libraries
OMNETPP_LIB_SUBDIR = $(OMNETPP_LIB_DIR)/$(TOOLCHAIN_NAME)
OMNETPP_LIBS = -L"$(OMNETPP_LIB_SUBDIR)" -L"$(OMNETPP_LIB_DIR)" -loppmain$D $(USERIF_LIBS) $(KERNEL_LIBS) $(SYS_LIBS)

COPTS = $(CFLAGS) -DINET_IMPORT $(INCLUDE_PATH) -I$(OMNETPP_INCL_DIR)
MSGCOPTS = $(INCLUDE_PATH)

# we want to recompile everything if COPTS changes,
# so we store COPTS into $COPTS_FILE and have object
# files depend on it (except when "make depend" was called)
COPTS_FILE = $O/.last-copts
ifneq ($(MAKECMDGOALS),depend)
ifneq ("$(COPTS)","$(shell cat $(COPTS_FILE) 2>/dev/null || echo '')")
$(shell $(MKPATH) "$O" && echo "$(COPTS)" >$(COPTS_FILE))
endif
endif

#------------------------------------------------------------------------------
# User-supplied makefile fragment(s)
# >>>
# <<<
#------------------------------------------------------------------------------

# Main target
all: $O/$(TARGET)
	$(Q)$(LN) $O/$(TARGET) .

$O/$(TARGET): $(OBJS)  $(wildcard $(EXTRA_OBJS)) Makefile
	@$(MKPATH) $O
	@echo Creating executable: $@
	$(Q)$(CXX) $(LDFLAGS) -o $O/$(TARGET)  $(OBJS) $(EXTRA_OBJS) $(AS_NEEDED_OFF) $(WHOLE_ARCHIVE_ON) $(LIBS) $(WHOLE_ARCHIVE_OFF) $(OMNETPP_LIBS)

.PHONY: all clean cleanall depend msgheaders

.SUFFIXES: .cc

$O/%.o: %.cc $(COPTS_FILE)
	@$(MKPATH) $(dir $@)
	$(qecho) "$<"
	$(Q)$(CXX) -c $(COPTS) -o $@ $<

%_m.cc %_m.h: %.msg
	$(qecho) MSGC: $<
	$(Q)$(MSGC) -s _m.cc $(MSGCOPTS) $?

msgheaders: $(MSGFILES:.msg=_m.h)

clean:
	$(qecho) Cleaning...
	$(Q)-rm -rf $O
	$(Q)-rm -f DataCenter DataCenter.exe libDataCenter.so libDataCenter.a libDataCenter.dll libDataCenter.dylib
	$(Q)-rm -f ./*_m.cc ./*_m.h
	$(Q)-rm -f model/*_m.cc model/*_m.h
	$(Q)-rm -f model/common/*_m.cc model/common/*_m.h
	$(Q)-rm -f model/link/*_m.cc model/link/*_m.h
	$(Q)-rm -f model/networks/*_m.cc model/networks/*_m.h
	$(Q)-rm -f model/networks/fattree/*_m.cc model/networks/fattree/*_m.h
	$(Q)-rm -f model/networks/fattree/generatedOutsideOmnet/*_m.cc model/networks/fattree/generatedOutsideOmnet/*_m.h
	$(Q)-rm -f model/networks/fattree/iterative/*_m.cc model/networks/fattree/iterative/*_m.h
	$(Q)-rm -f model/networks/fattree/recursive/*_m.cc model/networks/fattree/recursive/*_m.h
	$(Q)-rm -f model/networks/testNetworks/*_m.cc model/networks/testNetworks/*_m.h
	$(Q)-rm -f model/node/*_m.cc model/node/*_m.h
	$(Q)-rm -f model/node/applicationLayer/*_m.cc model/node/applicationLayer/*_m.h
	$(Q)-rm -f model/node/applicationLayer/BklgSchedApplication/*_m.cc model/node/applicationLayer/BklgSchedApplication/*_m.h
	$(Q)-rm -f model/node/applicationLayer/TCPMessageApplication/*_m.cc model/node/applicationLayer/TCPMessageApplication/*_m.h
	$(Q)-rm -f model/node/applicationLayer/messageApplication/*_m.cc model/node/applicationLayer/messageApplication/*_m.h
	$(Q)-rm -f model/node/applicationLayer/messageApplication/trafficPatterns/*_m.cc model/node/applicationLayer/messageApplication/trafficPatterns/*_m.h
	$(Q)-rm -f model/node/applicationLayer/resequencingTestSource/*_m.cc model/node/applicationLayer/resequencingTestSource/*_m.h
	$(Q)-rm -f model/node/applicationLayer/trafficSourceApplication/*_m.cc model/node/applicationLayer/trafficSourceApplication/*_m.h
	$(Q)-rm -f model/node/control/*_m.cc model/node/control/*_m.h
	$(Q)-rm -f model/node/linkLayer/*_m.cc model/node/linkLayer/*_m.h
	$(Q)-rm -f model/node/networkLayer/*_m.cc model/node/networkLayer/*_m.h
	$(Q)-rm -f model/node/resequencingLayer/*_m.cc model/node/resequencingLayer/*_m.h
	$(Q)-rm -f model/node/resequencingLayer/test/*_m.cc model/node/resequencingLayer/test/*_m.h
	$(Q)-rm -f model/node/schedulingLayer/*_m.cc model/node/schedulingLayer/*_m.h
	$(Q)-rm -f model/node/schedulingLayer/proxy/*_m.cc model/node/schedulingLayer/proxy/*_m.h
	$(Q)-rm -f model/node/schedulingLayer/schedFromFile/*_m.cc model/node/schedulingLayer/schedFromFile/*_m.h
	$(Q)-rm -f model/node/server/*_m.cc model/node/server/*_m.h
	$(Q)-rm -f model/node/transportLayer/*_m.cc model/node/transportLayer/*_m.h
	$(Q)-rm -f model/packets/*_m.cc model/packets/*_m.h
	$(Q)-rm -f model/switch/*_m.cc model/switch/*_m.h

cleanall: clean
	$(Q)-rm -rf $(PROJECT_OUTPUT_DIR)

depend:
	$(qecho) Creating dependencies...
	$(Q)$(MAKEDEPEND) $(INCLUDE_PATH) -f Makefile -P\$$O/ -- $(MSG_CC_FILES)  ./*.cc model/*.cc model/common/*.cc model/link/*.cc model/networks/*.cc model/networks/fattree/*.cc model/networks/fattree/generatedOutsideOmnet/*.cc model/networks/fattree/iterative/*.cc model/networks/fattree/recursive/*.cc model/networks/testNetworks/*.cc model/node/*.cc model/node/applicationLayer/*.cc model/node/applicationLayer/BklgSchedApplication/*.cc model/node/applicationLayer/TCPMessageApplication/*.cc model/node/applicationLayer/messageApplication/*.cc model/node/applicationLayer/messageApplication/trafficPatterns/*.cc model/node/applicationLayer/resequencingTestSource/*.cc model/node/applicationLayer/trafficSourceApplication/*.cc model/node/control/*.cc model/node/linkLayer/*.cc model/node/networkLayer/*.cc model/node/resequencingLayer/*.cc model/node/resequencingLayer/test/*.cc model/node/schedulingLayer/*.cc model/node/schedulingLayer/proxy/*.cc model/node/schedulingLayer/schedFromFile/*.cc model/node/server/*.cc model/node/transportLayer/*.cc model/packets/*.cc model/switch/*.cc

# DO NOT DELETE THIS LINE -- make depend depends on it.
$O/model/common/BandwidthMeter.o: model/common/BandwidthMeter.cc \
	model/common/BandwidthMeter.h \
	model/common/DCCommon.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/common/DCCommon.o: model/common/DCCommon.cc \
	model/common/DCCommon.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/common/DCUtilities.o: model/common/DCUtilities.cc \
	model/common/DCUtilities.h
$O/model/common/FatTreeNode.o: model/common/FatTreeNode.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/node_id.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/common/L2Queue.o: model/common/L2Queue.cc \
	model/common/DCCommon.h \
	model/common/L2Queue.h \
	model/common/VirtualPacketQueue.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/common/PacketDropper.o: model/common/PacketDropper.cc \
	model/common/DCCommon.h \
	model/common/PacketDropper.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/common/ServerBuffer.o: model/common/ServerBuffer.cc \
	model/common/DCCommon.h \
	model/common/ServerBuffer.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/common/ServerStream.o: model/common/ServerStream.cc \
	model/common/DCCommon.h \
	model/common/ServerStream.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/common/VirtualPacketQueue.o: model/common/VirtualPacketQueue.cc \
	model/common/DCCommon.h \
	model/common/VirtualPacketQueue.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/common/node_id.o: model/common/node_id.cc \
	model/common/node_id.h \
	model/common/std_includes.h
$O/model/common/set.o: model/common/set.cc \
	model/common/DCCommon.h \
	model/common/set.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/link/DCLink.o: model/link/DCLink.cc \
	model/common/DCCommon.h \
	model/link/DCLink.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/BklgSchedApplication/BklgSchedApplication.o: model/node/applicationLayer/BklgSchedApplication/BklgSchedApplication.cc \
	model/common/DCCommon.h \
	model/common/DCUtilities.h \
	model/common/FatTreeNode.h \
	model/common/ServerStream.h \
	model/common/node_id.h \
	model/node/applicationLayer/BklgSchedApplication/BklgSchedApplication.h \
	model/node/applicationLayer/BklgSchedApplication/ServerBacklog.h \
	model/node/applicationLayer/messageApplication/ActiveMessage.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/MessageApplication.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPatternGenerator.h \
	model/node/control/ModuleWithControlPort.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/BklgSchedApplication/ServerBacklog.o: model/node/applicationLayer/BklgSchedApplication/ServerBacklog.cc \
	model/common/DCCommon.h \
	model/common/ServerStream.h \
	model/node/applicationLayer/BklgSchedApplication/ServerBacklog.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/TCPMessageApplication/TCPMessageApplication.o: model/node/applicationLayer/TCPMessageApplication/TCPMessageApplication.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/ServerStream.h \
	model/common/node_id.h \
	model/node/applicationLayer/TCPMessageApplication/TCPMessageApplication.h \
	model/node/applicationLayer/messageApplication/ActiveMessage.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/MessageApplication.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPatternGenerator.h \
	model/node/control/ModuleWithControlPort.h \
	model/node/networkLayer/NetworkLayerBase.h \
	model/node/networkLayer/VirtualIP.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/applications/tcpapp/TCPSrvHostApp.h \
	$(INET_PROJ)/src/base/ByteArray.h \
	$(INET_PROJ)/src/base/ByteArray_m.h \
	$(INET_PROJ)/src/base/ILifecycle.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/base/LifecycleOperation.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INET_PROJ)/src/transport/contract/TCPCommand_m.h \
	$(INET_PROJ)/src/transport/contract/TCPSocket.h \
	$(INET_PROJ)/src/transport/contract/TCPSocketMap.h \
	$(INET_PROJ)/src/transport/tcp_common/TCPSegment.h \
	$(INET_PROJ)/src/transport/tcp_common/TCPSegment_m.h
$O/model/node/applicationLayer/messageApplication/ActiveMessage.o: model/node/applicationLayer/messageApplication/ActiveMessage.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/ServerStream.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/ActiveMessage.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/MessageApplication.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPatternGenerator.h \
	model/node/control/ModuleWithControlPort.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/AppMessage.o: model/node/applicationLayer/messageApplication/AppMessage.cc \
	model/common/DCCommon.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/MAAdjustQueueSizeToRate.o: model/node/applicationLayer/messageApplication/MAAdjustQueueSizeToRate.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/L2Queue.h \
	model/common/ServerStream.h \
	model/common/VirtualPacketQueue.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/ActiveMessage.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/MAAdjustQueueSizeToRate.h \
	model/node/applicationLayer/messageApplication/MAAdjustRateToThreshold.h \
	model/node/applicationLayer/messageApplication/MessageApplication.h \
	model/node/applicationLayer/messageApplication/UpdateQueueSizeMessage_m.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPatternGenerator.h \
	model/node/control/ModuleWithControlPort.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	model/switch/SwitchPortQueue.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/MAAdjustRateToThreshold.o: model/node/applicationLayer/messageApplication/MAAdjustRateToThreshold.cc \
	model/common/BandwidthMeter.h \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/L2Queue.h \
	model/common/ServerStream.h \
	model/common/VirtualPacketQueue.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/ActiveMessage.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/MAAdjustRateToThreshold.h \
	model/node/applicationLayer/messageApplication/MessageApplication.h \
	model/node/applicationLayer/messageApplication/UpdateSendingRateMessage_m.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPatternGenerator.h \
	model/node/control/ModuleWithControlPort.h \
	model/node/linkLayer/ServerPortQueue.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	model/switch/SwitchPortQueue.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/MessageApplication.o: model/node/applicationLayer/messageApplication/MessageApplication.cc \
	model/common/DCCommon.h \
	model/common/DCUtilities.h \
	model/common/FatTreeNode.h \
	model/common/ServerStream.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/ActiveMessage.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/MessageApplication.h \
	model/node/applicationLayer/messageApplication/ScriptGenerator.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPatternGenerator.h \
	model/node/control/ModuleWithControlPort.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/ScriptGenerator.o: model/node/applicationLayer/messageApplication/ScriptGenerator.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/ServerStream.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/ActiveMessage.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/MessageApplication.h \
	model/node/applicationLayer/messageApplication/ScriptGenerator.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPatternGenerator.h \
	model/node/control/ModuleWithControlPort.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/UpdateQueueSizeMessage_m.o: model/node/applicationLayer/messageApplication/UpdateQueueSizeMessage_m.cc \
	model/node/applicationLayer/messageApplication/UpdateQueueSizeMessage_m.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h
$O/model/node/applicationLayer/messageApplication/UpdateSendingRateMessage_m.o: model/node/applicationLayer/messageApplication/UpdateSendingRateMessage_m.cc \
	model/node/applicationLayer/messageApplication/UpdateSendingRateMessage_m.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h
$O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAll.o: model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAll.cc \
	model/common/DCCommon.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAll.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAllPartition.o: model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAllPartition.cc \
	model/common/DCCommon.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAllPartition.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAllVictimTenant.o: model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAllVictimTenant.cc \
	model/common/DCCommon.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAllPartition.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAllVictimTenant.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_LBDestImbalance.o: model/node/applicationLayer/messageApplication/trafficPatterns/TP_LBDestImbalance.cc \
	model/common/DCCommon.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_LBDestImbalance.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_PairedPermutation.o: model/node/applicationLayer/messageApplication/trafficPatterns/TP_PairedPermutation.cc \
	model/common/DCCommon.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_PairedPermutation.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_PairedPodPermutation.o: model/node/applicationLayer/messageApplication/trafficPatterns/TP_PairedPodPermutation.cc \
	model/common/DCCommon.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_PairedPodPermutation.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/trafficPatterns/TP_Permutation.o: model/node/applicationLayer/messageApplication/trafficPatterns/TP_Permutation.cc \
	model/common/DCCommon.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_Permutation.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.o: model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.cc \
	model/common/DCCommon.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPatternGenerator.o: model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPatternGenerator.cc \
	model/common/DCCommon.h \
	model/common/DCUtilities.h \
	model/common/FatTreeNode.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/AppMessage.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAll.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAllPartition.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_AllToAllVictimTenant.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_LBDestImbalance.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_PairedPermutation.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_PairedPodPermutation.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TP_Permutation.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPattern.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPatternFactory.h \
	model/node/applicationLayer/messageApplication/trafficPatterns/TrafficPatternGenerator.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/resequencingTestSource/ResequencingTestSource.o: model/node/applicationLayer/resequencingTestSource/ResequencingTestSource.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/node_id.h \
	model/node/applicationLayer/resequencingTestSource/ResequencingTestSource.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/trafficSourceApplication/TrafficRegulator.o: model/node/applicationLayer/trafficSourceApplication/TrafficRegulator.cc \
	model/common/DCCommon.h \
	model/node/applicationLayer/trafficSourceApplication/TrafficRegulator.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/trafficSourceApplication/TrafficSink.o: model/node/applicationLayer/trafficSourceApplication/TrafficSink.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/node_id.h \
	model/node/applicationLayer/trafficSourceApplication/TrafficSink.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/trafficSourceApplication/TrafficSource.o: model/node/applicationLayer/trafficSourceApplication/TrafficSource.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/node_id.h \
	model/node/applicationLayer/trafficSourceApplication/TrafficRegulator.h \
	model/node/applicationLayer/trafficSourceApplication/TrafficSource.h \
	model/node/applicationLayer/trafficSourceApplication/TrafficSourceControlMessage_m.h \
	model/node/control/ModuleWithControlPort.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/applicationLayer/trafficSourceApplication/TrafficSourceControlMessage_m.o: model/node/applicationLayer/trafficSourceApplication/TrafficSourceControlMessage_m.cc \
	model/node/applicationLayer/trafficSourceApplication/TrafficSourceControlMessage_m.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h
$O/model/node/control/ControlLogic.o: model/node/control/ControlLogic.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/node_id.h \
	model/node/control/ControlLogic.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/control/ModuleWithControlPort.o: model/node/control/ModuleWithControlPort.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/node_id.h \
	model/node/control/ModuleWithControlPort.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/linkLayer/LoadBalancer.o: model/node/linkLayer/LoadBalancer.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/node_id.h \
	model/node/linkLayer/LoadBalancer.h \
	model/node/linkLayer/Path.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/linkLayer/MPLoadBalancer.o: model/node/linkLayer/MPLoadBalancer.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/node_id.h \
	model/node/linkLayer/LoadBalancer.h \
	model/node/linkLayer/MPLoadBalancer.h \
	model/node/linkLayer/Path.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/linkLayer/Path.o: model/node/linkLayer/Path.cc \
	model/common/DCCommon.h \
	model/node/linkLayer/Path.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/linkLayer/ServerPortQueue.o: model/node/linkLayer/ServerPortQueue.cc \
	model/common/BandwidthMeter.h \
	model/common/DCCommon.h \
	model/common/L2Queue.h \
	model/common/ServerStream.h \
	model/common/VirtualPacketQueue.h \
	model/node/linkLayer/ServerPortQueue.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/networkLayer/NetworkLayerBase.o: model/node/networkLayer/NetworkLayerBase.cc \
	model/common/DCCommon.h \
	model/node/networkLayer/NetworkLayerBase.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/ByteArray.h \
	$(INET_PROJ)/src/base/ByteArray_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INET_PROJ)/src/transport/tcp_common/TCPSegment.h \
	$(INET_PROJ)/src/transport/tcp_common/TCPSegment_m.h
$O/model/node/networkLayer/VirtualIP.o: model/node/networkLayer/VirtualIP.cc \
	model/common/DCCommon.h \
	model/common/node_id.h \
	model/node/networkLayer/NetworkLayerBase.h \
	model/node/networkLayer/VirtualIP.h \
	model/node/transportLayer/InetTCPConnectionWrapper.h \
	model/node/transportLayer/InetTCPWrapper.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/ByteArray.h \
	$(INET_PROJ)/src/base/ByteArray_m.h \
	$(INET_PROJ)/src/base/ILifecycle.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4ControlInfo.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4ControlInfo_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INET_PROJ)/src/transport/contract/TCPCommand_m.h \
	$(INET_PROJ)/src/transport/tcp/TCP.h \
	$(INET_PROJ)/src/transport/tcp/TCPConnection.h \
	$(INET_PROJ)/src/transport/tcp_common/TCPSegment.h \
	$(INET_PROJ)/src/transport/tcp_common/TCPSegment_m.h
$O/model/node/resequencingLayer/HybridResequencer.o: model/node/resequencingLayer/HybridResequencer.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/ServerBuffer.h \
	model/common/node_id.h \
	model/node/resequencingLayer/HybridResequencer.h \
	model/node/resequencingLayer/ResequencerBuffer.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/resequencingLayer/ResequencerBuffer.o: model/node/resequencingLayer/ResequencerBuffer.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/ServerBuffer.h \
	model/common/node_id.h \
	model/node/resequencingLayer/HybridResequencer.h \
	model/node/resequencingLayer/ResequencerBuffer.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/resequencingLayer/SequenceNumberResequencer.o: model/node/resequencingLayer/SequenceNumberResequencer.cc \
	model/common/DCCommon.h \
	model/node/resequencingLayer/SequenceNumberResequencer.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/schedulingLayer/Demultiplexer.o: model/node/schedulingLayer/Demultiplexer.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/ServerBuffer.h \
	model/common/node_id.h \
	model/node/control/ModuleWithControlPort.h \
	model/node/schedulingLayer/Demultiplexer.h \
	model/node/schedulingLayer/Multiplexer.h \
	model/node/schedulingLayer/SchedulingAlgorithm.h \
	model/node/schedulingLayer/SchedulingController.h \
	model/node/schedulingLayer/SchedulingPacket.h \
	model/node/schedulingLayer/SchedulingPacket_m.h \
	model/node/schedulingLayer/VirtualOutputQueue.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/schedulingLayer/Multiplexer.o: model/node/schedulingLayer/Multiplexer.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/ServerBuffer.h \
	model/common/node_id.h \
	model/node/control/ModuleWithControlPort.h \
	model/node/schedulingLayer/Demultiplexer.h \
	model/node/schedulingLayer/Multiplexer.h \
	model/node/schedulingLayer/SchedulingAlgorithm.h \
	model/node/schedulingLayer/SchedulingController.h \
	model/node/schedulingLayer/SchedulingPacket.h \
	model/node/schedulingLayer/SchedulingPacket_m.h \
	model/node/schedulingLayer/VirtualOutputQueue.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/schedulingLayer/SchedulingAlgorithm.o: model/node/schedulingLayer/SchedulingAlgorithm.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/ServerBuffer.h \
	model/common/node_id.h \
	model/node/control/ModuleWithControlPort.h \
	model/node/schedulingLayer/Demultiplexer.h \
	model/node/schedulingLayer/Multiplexer.h \
	model/node/schedulingLayer/SchedulingAlgorithm.h \
	model/node/schedulingLayer/SchedulingController.h \
	model/node/schedulingLayer/SchedulingPacket.h \
	model/node/schedulingLayer/SchedulingPacket_m.h \
	model/node/schedulingLayer/VirtualOutputQueue.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/schedulingLayer/SchedulingController.o: model/node/schedulingLayer/SchedulingController.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/ServerBuffer.h \
	model/common/node_id.h \
	model/node/control/ModuleWithControlPort.h \
	model/node/schedulingLayer/Demultiplexer.h \
	model/node/schedulingLayer/Multiplexer.h \
	model/node/schedulingLayer/SchedulingAlgorithm.h \
	model/node/schedulingLayer/SchedulingController.h \
	model/node/schedulingLayer/SchedulingMessage_m.h \
	model/node/schedulingLayer/SchedulingPacket.h \
	model/node/schedulingLayer/SchedulingPacket_m.h \
	model/node/schedulingLayer/VirtualOutputQueue.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/schedulingLayer/SchedulingMessage_m.o: model/node/schedulingLayer/SchedulingMessage_m.cc \
	model/node/schedulingLayer/SchedulingMessage_m.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h
$O/model/node/schedulingLayer/SchedulingPacket_m.o: model/node/schedulingLayer/SchedulingPacket_m.cc \
	model/node/schedulingLayer/SchedulingPacket_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/schedulingLayer/VirtualOutputQueue.o: model/node/schedulingLayer/VirtualOutputQueue.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/ServerBuffer.h \
	model/common/node_id.h \
	model/node/control/ModuleWithControlPort.h \
	model/node/schedulingLayer/Demultiplexer.h \
	model/node/schedulingLayer/Multiplexer.h \
	model/node/schedulingLayer/SchedulingAlgorithm.h \
	model/node/schedulingLayer/SchedulingController.h \
	model/node/schedulingLayer/SchedulingPacket.h \
	model/node/schedulingLayer/SchedulingPacket_m.h \
	model/node/schedulingLayer/VirtualOutputQueue.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/schedulingLayer/proxy/DistAlgProxy.o: model/node/schedulingLayer/proxy/DistAlgProxy.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/ServerBuffer.h \
	model/common/matrix.h \
	model/common/node_id.h \
	model/common/set.h \
	model/node/control/ModuleWithControlPort.h \
	model/node/schedulingLayer/Demultiplexer.h \
	model/node/schedulingLayer/Multiplexer.h \
	model/node/schedulingLayer/SchedulingAlgorithm.h \
	model/node/schedulingLayer/SchedulingController.h \
	model/node/schedulingLayer/SchedulingPacket.h \
	model/node/schedulingLayer/SchedulingPacket_m.h \
	model/node/schedulingLayer/VirtualOutputQueue.h \
	model/node/schedulingLayer/proxy/DistAlgProxy.h \
	model/node/schedulingLayer/proxy/LinkProxy.h \
	model/node/schedulingLayer/proxy/RequestPacket.h \
	model/node/schedulingLayer/proxy/RequestPacket_m.h \
	model/node/schedulingLayer/proxy/ResponsePacket.h \
	model/node/schedulingLayer/proxy/ResponsePacket_m.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/schedulingLayer/proxy/LinkProxy.o: model/node/schedulingLayer/proxy/LinkProxy.cc \
	model/common/DCCommon.h \
	model/common/matrix.h \
	model/common/set.h \
	model/node/schedulingLayer/SchedulingPacket.h \
	model/node/schedulingLayer/SchedulingPacket_m.h \
	model/node/schedulingLayer/proxy/LinkProxy.h \
	model/node/schedulingLayer/proxy/RequestPacket.h \
	model/node/schedulingLayer/proxy/RequestPacket_m.h \
	model/node/schedulingLayer/proxy/ResponsePacket.h \
	model/node/schedulingLayer/proxy/ResponsePacket_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/schedulingLayer/proxy/RequestPacket_m.o: model/node/schedulingLayer/proxy/RequestPacket_m.cc \
	model/node/schedulingLayer/SchedulingPacket.h \
	model/node/schedulingLayer/SchedulingPacket_m.h \
	model/node/schedulingLayer/proxy/RequestPacket_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/schedulingLayer/proxy/ResponsePacket_m.o: model/node/schedulingLayer/proxy/ResponsePacket_m.cc \
	model/node/schedulingLayer/SchedulingPacket.h \
	model/node/schedulingLayer/SchedulingPacket_m.h \
	model/node/schedulingLayer/proxy/ResponsePacket_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/schedulingLayer/schedFromFile/ScheduleFromFile.o: model/node/schedulingLayer/schedFromFile/ScheduleFromFile.cc \
	model/common/DCCommon.h \
	model/common/DCUtilities.h \
	model/common/FatTreeNode.h \
	model/common/ServerBuffer.h \
	model/common/node_id.h \
	model/node/control/ModuleWithControlPort.h \
	model/node/schedulingLayer/Demultiplexer.h \
	model/node/schedulingLayer/Multiplexer.h \
	model/node/schedulingLayer/SchedulingAlgorithm.h \
	model/node/schedulingLayer/SchedulingController.h \
	model/node/schedulingLayer/SchedulingPacket.h \
	model/node/schedulingLayer/SchedulingPacket_m.h \
	model/node/schedulingLayer/VirtualOutputQueue.h \
	model/node/schedulingLayer/schedFromFile/ScheduleFromFile.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/node/transportLayer/InetTCPConnectionWrapper.o: model/node/transportLayer/InetTCPConnectionWrapper.cc \
	model/common/DCCommon.h \
	model/node/transportLayer/InetTCPConnectionWrapper.h \
	model/node/transportLayer/InetTCPWrapper.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/ByteArray.h \
	$(INET_PROJ)/src/base/ByteArray_m.h \
	$(INET_PROJ)/src/base/ILifecycle.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4ControlInfo.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4ControlInfo_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6ControlInfo.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6ControlInfo_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INET_PROJ)/src/transport/contract/TCPCommand_m.h \
	$(INET_PROJ)/src/transport/tcp/TCP.h \
	$(INET_PROJ)/src/transport/tcp/TCPConnection.h \
	$(INET_PROJ)/src/transport/tcp_common/TCPSegment.h \
	$(INET_PROJ)/src/transport/tcp_common/TCPSegment_m.h
$O/model/node/transportLayer/InetTCPWrapper.o: model/node/transportLayer/InetTCPWrapper.cc \
	model/common/DCCommon.h \
	model/node/transportLayer/InetTCPConnectionWrapper.h \
	model/node/transportLayer/InetTCPWrapper.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/ByteArray.h \
	$(INET_PROJ)/src/base/ByteArray_m.h \
	$(INET_PROJ)/src/base/ILifecycle.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/linklayer/contract/MACAddress.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4ControlInfo.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4ControlInfo_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h \
	$(INET_PROJ)/src/transport/contract/TCPCommand_m.h \
	$(INET_PROJ)/src/transport/tcp/TCP.h \
	$(INET_PROJ)/src/transport/tcp/TCPConnection.h \
	$(INET_PROJ)/src/transport/tcp_common/TCPSegment.h \
	$(INET_PROJ)/src/transport/tcp_common/TCPSegment_m.h
$O/model/node/transportLayer/SimpleUDP.o: model/node/transportLayer/SimpleUDP.cc \
	model/common/DCCommon.h \
	model/node/transportLayer/SimpleUDP.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/packets/ControlMessage.o: model/packets/ControlMessage.cc \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h
$O/model/packets/ControlMessage_m.o: model/packets/ControlMessage_m.cc \
	model/packets/ControlMessage_m.h
$O/model/packets/DCN_EthPacket.o: model/packets/DCN_EthPacket.cc \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/packets/DCN_EthPacket_m.o: model/packets/DCN_EthPacket_m.cc \
	model/packets/DCN_EthPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/packets/DCN_IPPacket.o: model/packets/DCN_IPPacket.cc \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/packets/DCN_IPPacket_m.o: model/packets/DCN_IPPacket_m.cc \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/packets/DCN_TCPPacket.o: model/packets/DCN_TCPPacket.cc \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/packets/DCN_TCPPacket_m.o: model/packets/DCN_TCPPacket_m.cc \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/packets/DCN_UDPPacket.o: model/packets/DCN_UDPPacket.cc \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/packets/DCN_UDPPacket_m.o: model/packets/DCN_UDPPacket_m.cc \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_UDPPacket_m.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/switch/ControlProcessor.o: model/switch/ControlProcessor.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/L2Queue.h \
	model/common/VirtualPacketQueue.h \
	model/common/node_id.h \
	model/node/applicationLayer/messageApplication/UpdateQueueSizeMessage_m.h \
	model/packets/ControlMessage.h \
	model/packets/ControlMessage_m.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	model/switch/ControlProcessor.h \
	model/switch/SwitchPortQueue.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h
$O/model/switch/SwitchPortQueue.o: model/switch/SwitchPortQueue.cc \
	model/common/DCCommon.h \
	model/common/FatTreeNode.h \
	model/common/L2Queue.h \
	model/common/VirtualPacketQueue.h \
	model/common/node_id.h \
	model/packets/DCN_EthPacket.h \
	model/packets/DCN_EthPacket_m.h \
	model/packets/DCN_IPPacket.h \
	model/packets/DCN_IPPacket_m.h \
	model/packets/DCN_TCPPacket.h \
	model/packets/DCN_TCPPacket_m.h \
	model/packets/DCN_UDPPacket.h \
	model/packets/DCN_UDPPacket_m.h \
	model/switch/ControlProcessor.h \
	model/switch/SwitchPortQueue.h \
	$(INET_PROJ)/src/base/INETDefs.h \
	$(INET_PROJ)/src/networklayer/contract/IPProtocolId_m.h \
	$(INET_PROJ)/src/networklayer/contract/IPv4Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPv6Address.h \
	$(INET_PROJ)/src/networklayer/contract/IPvXAddress.h \
	$(INET_PROJ)/src/networklayer/ipv4/IPv4Datagram_m.h

