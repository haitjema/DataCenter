//
// Generated file, do not edit! Created by opp_msgc 4.3 from model/node/schedulingLayer/proxy/ResponsePacket.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "ResponsePacket_m.h"

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




ResponsePacket_Base::ResponsePacket_Base(const char *name, int kind) : SchedulingPacket(name,kind)
{
    this->setSchedPktType(SCHEDULING_RESPONSE);

}

ResponsePacket_Base::ResponsePacket_Base(const ResponsePacket_Base& other) : SchedulingPacket(other)
{
    copy(other);
}

ResponsePacket_Base::~ResponsePacket_Base()
{
}

ResponsePacket_Base& ResponsePacket_Base::operator=(const ResponsePacket_Base& other)
{
    if (this==&other) return *this;
    SchedulingPacket::operator=(other);
    copy(other);
    return *this;
}

void ResponsePacket_Base::copy(const ResponsePacket_Base& other)
{
    this->share_var = other.share_var;
    this->rate_var = other.rate_var;
}

void ResponsePacket_Base::parsimPack(cCommBuffer *b)
{
    SchedulingPacket::parsimPack(b);
    doPacking(b,this->share_var);
    doPacking(b,this->rate_var);
}

void ResponsePacket_Base::parsimUnpack(cCommBuffer *b)
{
    SchedulingPacket::parsimUnpack(b);
    doUnpacking(b,this->share_var);
    doUnpacking(b,this->rate_var);
}

bklg_t& ResponsePacket_Base::getShare()
{
    return share_var;
}

void ResponsePacket_Base::setShare(const bklg_t& share)
{
    this->share_var = share;
}

rate_t& ResponsePacket_Base::getRate()
{
    return rate_var;
}

void ResponsePacket_Base::setRate(const rate_t& rate)
{
    this->rate_var = rate;
}

class ResponsePacketDescriptor : public cClassDescriptor
{
  public:
    ResponsePacketDescriptor();
    virtual ~ResponsePacketDescriptor();

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

Register_ClassDescriptor(ResponsePacketDescriptor);

ResponsePacketDescriptor::ResponsePacketDescriptor() : cClassDescriptor("ResponsePacket", "SchedulingPacket")
{
}

ResponsePacketDescriptor::~ResponsePacketDescriptor()
{
}

bool ResponsePacketDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<ResponsePacket_Base *>(obj)!=NULL;
}

const char *ResponsePacketDescriptor::getProperty(const char *propertyname) const
{
    if (!strcmp(propertyname,"customize")) return "true";
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int ResponsePacketDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 2+basedesc->getFieldCount(object) : 2;
}

unsigned int ResponsePacketDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISCOMPOUND,
        FD_ISCOMPOUND,
    };
    return (field>=0 && field<2) ? fieldTypeFlags[field] : 0;
}

const char *ResponsePacketDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "share",
        "rate",
    };
    return (field>=0 && field<2) ? fieldNames[field] : NULL;
}

int ResponsePacketDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='s' && strcmp(fieldName, "share")==0) return base+0;
    if (fieldName[0]=='r' && strcmp(fieldName, "rate")==0) return base+1;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *ResponsePacketDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "bklg_t",
        "rate_t",
    };
    return (field>=0 && field<2) ? fieldTypeStrings[field] : NULL;
}

const char *ResponsePacketDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
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

int ResponsePacketDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    ResponsePacket_Base *pp = (ResponsePacket_Base *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string ResponsePacketDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    ResponsePacket_Base *pp = (ResponsePacket_Base *)object; (void)pp;
    switch (field) {
        case 0: {std::stringstream out; out << pp->getShare(); return out.str();}
        case 1: {std::stringstream out; out << pp->getRate(); return out.str();}
        default: return "";
    }
}

bool ResponsePacketDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    ResponsePacket_Base *pp = (ResponsePacket_Base *)object; (void)pp;
    switch (field) {
        default: return false;
    }
}

const char *ResponsePacketDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldStructNames[] = {
        "bklg_t",
        "rate_t",
    };
    return (field>=0 && field<2) ? fieldStructNames[field] : NULL;
}

void *ResponsePacketDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    ResponsePacket_Base *pp = (ResponsePacket_Base *)object; (void)pp;
    switch (field) {
        case 0: return (void *)(&pp->getShare()); break;
        case 1: return (void *)(&pp->getRate()); break;
        default: return NULL;
    }
}


