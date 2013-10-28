//
// Generated file, do not edit! Created by opp_msgc 4.3 from model/node/schedulingLayer/SchedulingPacket.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "SchedulingPacket_m.h"

// Template rule which fires if a struct or class doesn't have operator<<
template<typename T>
std::ostream& operator<<(std::ostream& out,const T&) {return out;}

// Another default rule (prevents compiler from choosing base class' doPacking())
template<typename T>
void doPacking(cCommBuffer *, T& t) {
    throw cRuntimeError("Parsim error: no doPacking() function for type %s or its base class (check .msg and _m.cc/h files!)",opp_typename(typeid(t)));
}

template<typename T>
void doUnpacking(cCommBuffer *, T& t) {
    throw cRuntimeError("Parsim error: no doUnpacking() function for type %s or its base class (check .msg and _m.cc/h files!)",opp_typename(typeid(t)));
}




EXECUTE_ON_STARTUP(
    cEnum *e = cEnum::find("SchedulingPacketTypes");
    if (!e) enums.getInstance()->add(e = new cEnum("SchedulingPacketTypes"));
    e->insert(SCHEDULING_BACKLOG_REPORT, "SCHEDULING_BACKLOG_REPORT");
    e->insert(SCHEDULING_RATE_ASSIGNMENT, "SCHEDULING_RATE_ASSIGNMENT");
    e->insert(SCHEDULING_COMPLETE_BACKLOG, "SCHEDULING_COMPLETE_BACKLOG");
    e->insert(SCHEDULING_PKT_ASYNCHRONOUS, "SCHEDULING_PKT_ASYNCHRONOUS");
    e->insert(SCHEDULING_PKT_CHARNY, "SCHEDULING_PKT_CHARNY");
    e->insert(SCHEDULING_PKT_MC, "SCHEDULING_PKT_MC");
    e->insert(SCHEDULING_BKLG_PROP_REQ, "SCHEDULING_BKLG_PROP_REQ");
    e->insert(SCHEDULING_BKLG_PROP_RESP, "SCHEDULING_BKLG_PROP_RESP");
    e->insert(SCHEDULING_REQUEST, "SCHEDULING_REQUEST");
    e->insert(SCHEDULING_RESPONSE, "SCHEDULING_RESPONSE");
);

Register_Class(SchedulingPacket);

SchedulingPacket::SchedulingPacket(const char *name, int kind) : DCN_EthPacket(name,kind)
{
    this->setKind(DCN_SCHEDULING_PACKET);
    this->setDataPacket(false);

    this->schedPktType_var = 0;
}

SchedulingPacket::SchedulingPacket(const SchedulingPacket& other) : DCN_EthPacket(other)
{
    copy(other);
}

SchedulingPacket::~SchedulingPacket()
{
}

SchedulingPacket& SchedulingPacket::operator=(const SchedulingPacket& other)
{
    if (this==&other) return *this;
    DCN_EthPacket::operator=(other);
    copy(other);
    return *this;
}

void SchedulingPacket::copy(const SchedulingPacket& other)
{
    this->schedPktType_var = other.schedPktType_var;
}

void SchedulingPacket::parsimPack(cCommBuffer *b)
{
    DCN_EthPacket::parsimPack(b);
    doPacking(b,this->schedPktType_var);
}

void SchedulingPacket::parsimUnpack(cCommBuffer *b)
{
    DCN_EthPacket::parsimUnpack(b);
    doUnpacking(b,this->schedPktType_var);
}

unsigned short SchedulingPacket::getSchedPktType() const
{
    return schedPktType_var;
}

void SchedulingPacket::setSchedPktType(unsigned short schedPktType)
{
    this->schedPktType_var = schedPktType;
}

class SchedulingPacketDescriptor : public cClassDescriptor
{
  public:
    SchedulingPacketDescriptor();
    virtual ~SchedulingPacketDescriptor();

    virtual bool doesSupport(cObject *obj) const;
    virtual const char *getProperty(const char *propertyname) const;
    virtual int getFieldCount(void *object) const;
    virtual const char *getFieldName(void *object, int field) const;
    virtual int findField(void *object, const char *fieldName) const;
    virtual unsigned int getFieldTypeFlags(void *object, int field) const;
    virtual const char *getFieldTypeString(void *object, int field) const;
    virtual const char *getFieldProperty(void *object, int field, const char *propertyname) const;
    virtual int getArraySize(void *object, int field) const;

    virtual std::string getFieldAsString(void *object, int field, int i) const;
    virtual bool setFieldAsString(void *object, int field, int i, const char *value) const;

    virtual const char *getFieldStructName(void *object, int field) const;
    virtual void *getFieldStructPointer(void *object, int field, int i) const;
};

Register_ClassDescriptor(SchedulingPacketDescriptor);

SchedulingPacketDescriptor::SchedulingPacketDescriptor() : cClassDescriptor("SchedulingPacket", "DCN_EthPacket")
{
}

SchedulingPacketDescriptor::~SchedulingPacketDescriptor()
{
}

bool SchedulingPacketDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<SchedulingPacket *>(obj)!=NULL;
}

const char *SchedulingPacketDescriptor::getProperty(const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int SchedulingPacketDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 1+basedesc->getFieldCount(object) : 1;
}

unsigned int SchedulingPacketDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISEDITABLE,
    };
    return (field>=0 && field<1) ? fieldTypeFlags[field] : 0;
}

const char *SchedulingPacketDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "schedPktType",
    };
    return (field>=0 && field<1) ? fieldNames[field] : NULL;
}

int SchedulingPacketDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='s' && strcmp(fieldName, "schedPktType")==0) return base+0;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *SchedulingPacketDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "unsigned short",
    };
    return (field>=0 && field<1) ? fieldTypeStrings[field] : NULL;
}

const char *SchedulingPacketDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldProperty(object, field, propertyname);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        case 0:
            if (!strcmp(propertyname,"enum")) return "SchedulingPacketTypes";
            return NULL;
        default: return NULL;
    }
}

int SchedulingPacketDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    SchedulingPacket *pp = (SchedulingPacket *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string SchedulingPacketDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    SchedulingPacket *pp = (SchedulingPacket *)object; (void)pp;
    switch (field) {
        case 0: return ulong2string(pp->getSchedPktType());
        default: return "";
    }
}

bool SchedulingPacketDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    SchedulingPacket *pp = (SchedulingPacket *)object; (void)pp;
    switch (field) {
        case 0: pp->setSchedPktType(string2ulong(value)); return true;
        default: return false;
    }
}

const char *SchedulingPacketDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldStructNames[] = {
        NULL,
    };
    return (field>=0 && field<1) ? fieldStructNames[field] : NULL;
}

void *SchedulingPacketDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    SchedulingPacket *pp = (SchedulingPacket *)object; (void)pp;
    switch (field) {
        default: return NULL;
    }
}

Register_Class(BacklogReport);

BacklogReport::BacklogReport(const char *name, int kind) : SchedulingPacket(name,kind)
{
    this->setSchedPktType(SCHEDULING_BACKLOG_REPORT);

    this->backlog_var = 0;
}

BacklogReport::BacklogReport(const BacklogReport& other) : SchedulingPacket(other)
{
    copy(other);
}

BacklogReport::~BacklogReport()
{
}

BacklogReport& BacklogReport::operator=(const BacklogReport& other)
{
    if (this==&other) return *this;
    SchedulingPacket::operator=(other);
    copy(other);
    return *this;
}

void BacklogReport::copy(const BacklogReport& other)
{
    this->backlog_var = other.backlog_var;
}

void BacklogReport::parsimPack(cCommBuffer *b)
{
    SchedulingPacket::parsimPack(b);
    doPacking(b,this->backlog_var);
}

void BacklogReport::parsimUnpack(cCommBuffer *b)
{
    SchedulingPacket::parsimUnpack(b);
    doUnpacking(b,this->backlog_var);
}

unsigned long BacklogReport::getBacklog() const
{
    return backlog_var;
}

void BacklogReport::setBacklog(unsigned long backlog)
{
    this->backlog_var = backlog;
}

class BacklogReportDescriptor : public cClassDescriptor
{
  public:
    BacklogReportDescriptor();
    virtual ~BacklogReportDescriptor();

    virtual bool doesSupport(cObject *obj) const;
    virtual const char *getProperty(const char *propertyname) const;
    virtual int getFieldCount(void *object) const;
    virtual const char *getFieldName(void *object, int field) const;
    virtual int findField(void *object, const char *fieldName) const;
    virtual unsigned int getFieldTypeFlags(void *object, int field) const;
    virtual const char *getFieldTypeString(void *object, int field) const;
    virtual const char *getFieldProperty(void *object, int field, const char *propertyname) const;
    virtual int getArraySize(void *object, int field) const;

    virtual std::string getFieldAsString(void *object, int field, int i) const;
    virtual bool setFieldAsString(void *object, int field, int i, const char *value) const;

    virtual const char *getFieldStructName(void *object, int field) const;
    virtual void *getFieldStructPointer(void *object, int field, int i) const;
};

Register_ClassDescriptor(BacklogReportDescriptor);

BacklogReportDescriptor::BacklogReportDescriptor() : cClassDescriptor("BacklogReport", "SchedulingPacket")
{
}

BacklogReportDescriptor::~BacklogReportDescriptor()
{
}

bool BacklogReportDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<BacklogReport *>(obj)!=NULL;
}

const char *BacklogReportDescriptor::getProperty(const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int BacklogReportDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 1+basedesc->getFieldCount(object) : 1;
}

unsigned int BacklogReportDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISEDITABLE,
    };
    return (field>=0 && field<1) ? fieldTypeFlags[field] : 0;
}

const char *BacklogReportDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "backlog",
    };
    return (field>=0 && field<1) ? fieldNames[field] : NULL;
}

int BacklogReportDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='b' && strcmp(fieldName, "backlog")==0) return base+0;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *BacklogReportDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "unsigned long",
    };
    return (field>=0 && field<1) ? fieldTypeStrings[field] : NULL;
}

const char *BacklogReportDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldProperty(object, field, propertyname);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        default: return NULL;
    }
}

int BacklogReportDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    BacklogReport *pp = (BacklogReport *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string BacklogReportDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    BacklogReport *pp = (BacklogReport *)object; (void)pp;
    switch (field) {
        case 0: return ulong2string(pp->getBacklog());
        default: return "";
    }
}

bool BacklogReportDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    BacklogReport *pp = (BacklogReport *)object; (void)pp;
    switch (field) {
        case 0: pp->setBacklog(string2ulong(value)); return true;
        default: return false;
    }
}

const char *BacklogReportDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldStructNames[] = {
        NULL,
    };
    return (field>=0 && field<1) ? fieldStructNames[field] : NULL;
}

void *BacklogReportDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    BacklogReport *pp = (BacklogReport *)object; (void)pp;
    switch (field) {
        default: return NULL;
    }
}

Register_Class(RateAssignment);

RateAssignment::RateAssignment(const char *name, int kind) : SchedulingPacket(name,kind)
{
    this->setSchedPktType(SCHEDULING_RATE_ASSIGNMENT);

    this->rateAssignment_var = 0;
}

RateAssignment::RateAssignment(const RateAssignment& other) : SchedulingPacket(other)
{
    copy(other);
}

RateAssignment::~RateAssignment()
{
}

RateAssignment& RateAssignment::operator=(const RateAssignment& other)
{
    if (this==&other) return *this;
    SchedulingPacket::operator=(other);
    copy(other);
    return *this;
}

void RateAssignment::copy(const RateAssignment& other)
{
    this->rateAssignment_var = other.rateAssignment_var;
}

void RateAssignment::parsimPack(cCommBuffer *b)
{
    SchedulingPacket::parsimPack(b);
    doPacking(b,this->rateAssignment_var);
}

void RateAssignment::parsimUnpack(cCommBuffer *b)
{
    SchedulingPacket::parsimUnpack(b);
    doUnpacking(b,this->rateAssignment_var);
}

unsigned long RateAssignment::getRateAssignment() const
{
    return rateAssignment_var;
}

void RateAssignment::setRateAssignment(unsigned long rateAssignment)
{
    this->rateAssignment_var = rateAssignment;
}

class RateAssignmentDescriptor : public cClassDescriptor
{
  public:
    RateAssignmentDescriptor();
    virtual ~RateAssignmentDescriptor();

    virtual bool doesSupport(cObject *obj) const;
    virtual const char *getProperty(const char *propertyname) const;
    virtual int getFieldCount(void *object) const;
    virtual const char *getFieldName(void *object, int field) const;
    virtual int findField(void *object, const char *fieldName) const;
    virtual unsigned int getFieldTypeFlags(void *object, int field) const;
    virtual const char *getFieldTypeString(void *object, int field) const;
    virtual const char *getFieldProperty(void *object, int field, const char *propertyname) const;
    virtual int getArraySize(void *object, int field) const;

    virtual std::string getFieldAsString(void *object, int field, int i) const;
    virtual bool setFieldAsString(void *object, int field, int i, const char *value) const;

    virtual const char *getFieldStructName(void *object, int field) const;
    virtual void *getFieldStructPointer(void *object, int field, int i) const;
};

Register_ClassDescriptor(RateAssignmentDescriptor);

RateAssignmentDescriptor::RateAssignmentDescriptor() : cClassDescriptor("RateAssignment", "SchedulingPacket")
{
}

RateAssignmentDescriptor::~RateAssignmentDescriptor()
{
}

bool RateAssignmentDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<RateAssignment *>(obj)!=NULL;
}

const char *RateAssignmentDescriptor::getProperty(const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int RateAssignmentDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 1+basedesc->getFieldCount(object) : 1;
}

unsigned int RateAssignmentDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISEDITABLE,
    };
    return (field>=0 && field<1) ? fieldTypeFlags[field] : 0;
}

const char *RateAssignmentDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "rateAssignment",
    };
    return (field>=0 && field<1) ? fieldNames[field] : NULL;
}

int RateAssignmentDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='r' && strcmp(fieldName, "rateAssignment")==0) return base+0;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *RateAssignmentDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "unsigned long",
    };
    return (field>=0 && field<1) ? fieldTypeStrings[field] : NULL;
}

const char *RateAssignmentDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldProperty(object, field, propertyname);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        default: return NULL;
    }
}

int RateAssignmentDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    RateAssignment *pp = (RateAssignment *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string RateAssignmentDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    RateAssignment *pp = (RateAssignment *)object; (void)pp;
    switch (field) {
        case 0: return ulong2string(pp->getRateAssignment());
        default: return "";
    }
}

bool RateAssignmentDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    RateAssignment *pp = (RateAssignment *)object; (void)pp;
    switch (field) {
        case 0: pp->setRateAssignment(string2ulong(value)); return true;
        default: return false;
    }
}

const char *RateAssignmentDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldStructNames[] = {
        NULL,
    };
    return (field>=0 && field<1) ? fieldStructNames[field] : NULL;
}

void *RateAssignmentDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    RateAssignment *pp = (RateAssignment *)object; (void)pp;
    switch (field) {
        default: return NULL;
    }
}

Register_Class(CompleteBacklogReport);

CompleteBacklogReport::CompleteBacklogReport(const char *name, int kind) : SchedulingPacket(name,kind)
{
    this->setSchedPktType(SCHEDULING_COMPLETE_BACKLOG);

    backlog_arraysize = 0;
    this->backlog_var = 0;
}

CompleteBacklogReport::CompleteBacklogReport(const CompleteBacklogReport& other) : SchedulingPacket(other)
{
    backlog_arraysize = 0;
    this->backlog_var = 0;
    copy(other);
}

CompleteBacklogReport::~CompleteBacklogReport()
{
    delete [] backlog_var;
}

CompleteBacklogReport& CompleteBacklogReport::operator=(const CompleteBacklogReport& other)
{
    if (this==&other) return *this;
    SchedulingPacket::operator=(other);
    copy(other);
    return *this;
}

void CompleteBacklogReport::copy(const CompleteBacklogReport& other)
{
    delete [] this->backlog_var;
    this->backlog_var = (other.backlog_arraysize==0) ? NULL : new unsigned long[other.backlog_arraysize];
    backlog_arraysize = other.backlog_arraysize;
    for (unsigned int i=0; i<backlog_arraysize; i++)
        this->backlog_var[i] = other.backlog_var[i];
}

void CompleteBacklogReport::parsimPack(cCommBuffer *b)
{
    SchedulingPacket::parsimPack(b);
    b->pack(backlog_arraysize);
    doPacking(b,this->backlog_var,backlog_arraysize);
}

void CompleteBacklogReport::parsimUnpack(cCommBuffer *b)
{
    SchedulingPacket::parsimUnpack(b);
    delete [] this->backlog_var;
    b->unpack(backlog_arraysize);
    if (backlog_arraysize==0) {
        this->backlog_var = 0;
    } else {
        this->backlog_var = new unsigned long[backlog_arraysize];
        doUnpacking(b,this->backlog_var,backlog_arraysize);
    }
}

void CompleteBacklogReport::setBacklogArraySize(unsigned int size)
{
    unsigned long *backlog_var2 = (size==0) ? NULL : new unsigned long[size];
    unsigned int sz = backlog_arraysize < size ? backlog_arraysize : size;
    for (unsigned int i=0; i<sz; i++)
        backlog_var2[i] = this->backlog_var[i];
    for (unsigned int i=sz; i<size; i++)
        backlog_var2[i] = 0;
    backlog_arraysize = size;
    delete [] this->backlog_var;
    this->backlog_var = backlog_var2;
}

unsigned int CompleteBacklogReport::getBacklogArraySize() const
{
    return backlog_arraysize;
}

unsigned long CompleteBacklogReport::getBacklog(unsigned int k) const
{
    if (k>=backlog_arraysize) throw cRuntimeError("Array of size %d indexed by %d", backlog_arraysize, k);
    return backlog_var[k];
}

void CompleteBacklogReport::setBacklog(unsigned int k, unsigned long backlog)
{
    if (k>=backlog_arraysize) throw cRuntimeError("Array of size %d indexed by %d", backlog_arraysize, k);
    this->backlog_var[k] = backlog;
}

class CompleteBacklogReportDescriptor : public cClassDescriptor
{
  public:
    CompleteBacklogReportDescriptor();
    virtual ~CompleteBacklogReportDescriptor();

    virtual bool doesSupport(cObject *obj) const;
    virtual const char *getProperty(const char *propertyname) const;
    virtual int getFieldCount(void *object) const;
    virtual const char *getFieldName(void *object, int field) const;
    virtual int findField(void *object, const char *fieldName) const;
    virtual unsigned int getFieldTypeFlags(void *object, int field) const;
    virtual const char *getFieldTypeString(void *object, int field) const;
    virtual const char *getFieldProperty(void *object, int field, const char *propertyname) const;
    virtual int getArraySize(void *object, int field) const;

    virtual std::string getFieldAsString(void *object, int field, int i) const;
    virtual bool setFieldAsString(void *object, int field, int i, const char *value) const;

    virtual const char *getFieldStructName(void *object, int field) const;
    virtual void *getFieldStructPointer(void *object, int field, int i) const;
};

Register_ClassDescriptor(CompleteBacklogReportDescriptor);

CompleteBacklogReportDescriptor::CompleteBacklogReportDescriptor() : cClassDescriptor("CompleteBacklogReport", "SchedulingPacket")
{
}

CompleteBacklogReportDescriptor::~CompleteBacklogReportDescriptor()
{
}

bool CompleteBacklogReportDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<CompleteBacklogReport *>(obj)!=NULL;
}

const char *CompleteBacklogReportDescriptor::getProperty(const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int CompleteBacklogReportDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 1+basedesc->getFieldCount(object) : 1;
}

unsigned int CompleteBacklogReportDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISARRAY | FD_ISEDITABLE,
    };
    return (field>=0 && field<1) ? fieldTypeFlags[field] : 0;
}

const char *CompleteBacklogReportDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "backlog",
    };
    return (field>=0 && field<1) ? fieldNames[field] : NULL;
}

int CompleteBacklogReportDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='b' && strcmp(fieldName, "backlog")==0) return base+0;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *CompleteBacklogReportDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "unsigned long",
    };
    return (field>=0 && field<1) ? fieldTypeStrings[field] : NULL;
}

const char *CompleteBacklogReportDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldProperty(object, field, propertyname);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        default: return NULL;
    }
}

int CompleteBacklogReportDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    CompleteBacklogReport *pp = (CompleteBacklogReport *)object; (void)pp;
    switch (field) {
        case 0: return pp->getBacklogArraySize();
        default: return 0;
    }
}

std::string CompleteBacklogReportDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    CompleteBacklogReport *pp = (CompleteBacklogReport *)object; (void)pp;
    switch (field) {
        case 0: return ulong2string(pp->getBacklog(i));
        default: return "";
    }
}

bool CompleteBacklogReportDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    CompleteBacklogReport *pp = (CompleteBacklogReport *)object; (void)pp;
    switch (field) {
        case 0: pp->setBacklog(i,string2ulong(value)); return true;
        default: return false;
    }
}

const char *CompleteBacklogReportDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldStructNames[] = {
        NULL,
    };
    return (field>=0 && field<1) ? fieldStructNames[field] : NULL;
}

void *CompleteBacklogReportDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    CompleteBacklogReport *pp = (CompleteBacklogReport *)object; (void)pp;
    switch (field) {
        default: return NULL;
    }
}

Register_Class(AsynchronousSchedulingPacket);

AsynchronousSchedulingPacket::AsynchronousSchedulingPacket(const char *name, int kind) : SchedulingPacket(name,kind)
{
    this->setSchedPktType(SCHEDULING_PKT_ASYNCHRONOUS);

    this->stampedRate_var = 0;
    this->ubit_var = 0;
    this->backlog_var = 0;
}

AsynchronousSchedulingPacket::AsynchronousSchedulingPacket(const AsynchronousSchedulingPacket& other) : SchedulingPacket(other)
{
    copy(other);
}

AsynchronousSchedulingPacket::~AsynchronousSchedulingPacket()
{
}

AsynchronousSchedulingPacket& AsynchronousSchedulingPacket::operator=(const AsynchronousSchedulingPacket& other)
{
    if (this==&other) return *this;
    SchedulingPacket::operator=(other);
    copy(other);
    return *this;
}

void AsynchronousSchedulingPacket::copy(const AsynchronousSchedulingPacket& other)
{
    this->stampedRate_var = other.stampedRate_var;
    this->ubit_var = other.ubit_var;
    this->backlog_var = other.backlog_var;
}

void AsynchronousSchedulingPacket::parsimPack(cCommBuffer *b)
{
    SchedulingPacket::parsimPack(b);
    doPacking(b,this->stampedRate_var);
    doPacking(b,this->ubit_var);
    doPacking(b,this->backlog_var);
}

void AsynchronousSchedulingPacket::parsimUnpack(cCommBuffer *b)
{
    SchedulingPacket::parsimUnpack(b);
    doUnpacking(b,this->stampedRate_var);
    doUnpacking(b,this->ubit_var);
    doUnpacking(b,this->backlog_var);
}

unsigned long AsynchronousSchedulingPacket::getStampedRate() const
{
    return stampedRate_var;
}

void AsynchronousSchedulingPacket::setStampedRate(unsigned long stampedRate)
{
    this->stampedRate_var = stampedRate;
}

bool AsynchronousSchedulingPacket::getUbit() const
{
    return ubit_var;
}

void AsynchronousSchedulingPacket::setUbit(bool ubit)
{
    this->ubit_var = ubit;
}

unsigned long AsynchronousSchedulingPacket::getBacklog() const
{
    return backlog_var;
}

void AsynchronousSchedulingPacket::setBacklog(unsigned long backlog)
{
    this->backlog_var = backlog;
}

class AsynchronousSchedulingPacketDescriptor : public cClassDescriptor
{
  public:
    AsynchronousSchedulingPacketDescriptor();
    virtual ~AsynchronousSchedulingPacketDescriptor();

    virtual bool doesSupport(cObject *obj) const;
    virtual const char *getProperty(const char *propertyname) const;
    virtual int getFieldCount(void *object) const;
    virtual const char *getFieldName(void *object, int field) const;
    virtual int findField(void *object, const char *fieldName) const;
    virtual unsigned int getFieldTypeFlags(void *object, int field) const;
    virtual const char *getFieldTypeString(void *object, int field) const;
    virtual const char *getFieldProperty(void *object, int field, const char *propertyname) const;
    virtual int getArraySize(void *object, int field) const;

    virtual std::string getFieldAsString(void *object, int field, int i) const;
    virtual bool setFieldAsString(void *object, int field, int i, const char *value) const;

    virtual const char *getFieldStructName(void *object, int field) const;
    virtual void *getFieldStructPointer(void *object, int field, int i) const;
};

Register_ClassDescriptor(AsynchronousSchedulingPacketDescriptor);

AsynchronousSchedulingPacketDescriptor::AsynchronousSchedulingPacketDescriptor() : cClassDescriptor("AsynchronousSchedulingPacket", "SchedulingPacket")
{
}

AsynchronousSchedulingPacketDescriptor::~AsynchronousSchedulingPacketDescriptor()
{
}

bool AsynchronousSchedulingPacketDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<AsynchronousSchedulingPacket *>(obj)!=NULL;
}

const char *AsynchronousSchedulingPacketDescriptor::getProperty(const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int AsynchronousSchedulingPacketDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 3+basedesc->getFieldCount(object) : 3;
}

unsigned int AsynchronousSchedulingPacketDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
    };
    return (field>=0 && field<3) ? fieldTypeFlags[field] : 0;
}

const char *AsynchronousSchedulingPacketDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "stampedRate",
        "ubit",
        "backlog",
    };
    return (field>=0 && field<3) ? fieldNames[field] : NULL;
}

int AsynchronousSchedulingPacketDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='s' && strcmp(fieldName, "stampedRate")==0) return base+0;
    if (fieldName[0]=='u' && strcmp(fieldName, "ubit")==0) return base+1;
    if (fieldName[0]=='b' && strcmp(fieldName, "backlog")==0) return base+2;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *AsynchronousSchedulingPacketDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "unsigned long",
        "bool",
        "unsigned long",
    };
    return (field>=0 && field<3) ? fieldTypeStrings[field] : NULL;
}

const char *AsynchronousSchedulingPacketDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldProperty(object, field, propertyname);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        default: return NULL;
    }
}

int AsynchronousSchedulingPacketDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    AsynchronousSchedulingPacket *pp = (AsynchronousSchedulingPacket *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string AsynchronousSchedulingPacketDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    AsynchronousSchedulingPacket *pp = (AsynchronousSchedulingPacket *)object; (void)pp;
    switch (field) {
        case 0: return ulong2string(pp->getStampedRate());
        case 1: return bool2string(pp->getUbit());
        case 2: return ulong2string(pp->getBacklog());
        default: return "";
    }
}

bool AsynchronousSchedulingPacketDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    AsynchronousSchedulingPacket *pp = (AsynchronousSchedulingPacket *)object; (void)pp;
    switch (field) {
        case 0: pp->setStampedRate(string2ulong(value)); return true;
        case 1: pp->setUbit(string2bool(value)); return true;
        case 2: pp->setBacklog(string2ulong(value)); return true;
        default: return false;
    }
}

const char *AsynchronousSchedulingPacketDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldStructNames[] = {
        NULL,
        NULL,
        NULL,
    };
    return (field>=0 && field<3) ? fieldStructNames[field] : NULL;
}

void *AsynchronousSchedulingPacketDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    AsynchronousSchedulingPacket *pp = (AsynchronousSchedulingPacket *)object; (void)pp;
    switch (field) {
        default: return NULL;
    }
}


