//
// Generated file, do not edit! Created by opp_msgc 4.3 from model/node/applicationLayer/trafficSourceApplication/TrafficSourceControlMessage.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "TrafficSourceControlMessage_m.h"

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




Register_Class(TrafficSourceControlMessage);

TrafficSourceControlMessage::TrafficSourceControlMessage(const char *name, int kind) : ControlMessage(name,kind)
{
    this->setType(TRAFFIC_SOURCE_CONTROL_MSG);

    this->sendToServer_var = 0;
}

TrafficSourceControlMessage::TrafficSourceControlMessage(const TrafficSourceControlMessage& other) : ControlMessage(other)
{
    copy(other);
}

TrafficSourceControlMessage::~TrafficSourceControlMessage()
{
}

TrafficSourceControlMessage& TrafficSourceControlMessage::operator=(const TrafficSourceControlMessage& other)
{
    if (this==&other) return *this;
    ControlMessage::operator=(other);
    copy(other);
    return *this;
}

void TrafficSourceControlMessage::copy(const TrafficSourceControlMessage& other)
{
    this->sendToServer_var = other.sendToServer_var;
}

void TrafficSourceControlMessage::parsimPack(cCommBuffer *b)
{
    ControlMessage::parsimPack(b);
    doPacking(b,this->sendToServer_var);
}

void TrafficSourceControlMessage::parsimUnpack(cCommBuffer *b)
{
    ControlMessage::parsimUnpack(b);
    doUnpacking(b,this->sendToServer_var);
}

int TrafficSourceControlMessage::getSendToServer() const
{
    return sendToServer_var;
}

void TrafficSourceControlMessage::setSendToServer(int sendToServer)
{
    this->sendToServer_var = sendToServer;
}

class TrafficSourceControlMessageDescriptor : public cClassDescriptor
{
  public:
    TrafficSourceControlMessageDescriptor();
    virtual ~TrafficSourceControlMessageDescriptor();

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

Register_ClassDescriptor(TrafficSourceControlMessageDescriptor);

TrafficSourceControlMessageDescriptor::TrafficSourceControlMessageDescriptor() : cClassDescriptor("TrafficSourceControlMessage", "ControlMessage")
{
}

TrafficSourceControlMessageDescriptor::~TrafficSourceControlMessageDescriptor()
{
}

bool TrafficSourceControlMessageDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<TrafficSourceControlMessage *>(obj)!=NULL;
}

const char *TrafficSourceControlMessageDescriptor::getProperty(const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int TrafficSourceControlMessageDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 1+basedesc->getFieldCount(object) : 1;
}

unsigned int TrafficSourceControlMessageDescriptor::getFieldTypeFlags(void *object, int field) const
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

const char *TrafficSourceControlMessageDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "sendToServer",
    };
    return (field>=0 && field<1) ? fieldNames[field] : NULL;
}

int TrafficSourceControlMessageDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='s' && strcmp(fieldName, "sendToServer")==0) return base+0;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *TrafficSourceControlMessageDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "int",
    };
    return (field>=0 && field<1) ? fieldTypeStrings[field] : NULL;
}

const char *TrafficSourceControlMessageDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
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

int TrafficSourceControlMessageDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    TrafficSourceControlMessage *pp = (TrafficSourceControlMessage *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string TrafficSourceControlMessageDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    TrafficSourceControlMessage *pp = (TrafficSourceControlMessage *)object; (void)pp;
    switch (field) {
        case 0: return long2string(pp->getSendToServer());
        default: return "";
    }
}

bool TrafficSourceControlMessageDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    TrafficSourceControlMessage *pp = (TrafficSourceControlMessage *)object; (void)pp;
    switch (field) {
        case 0: pp->setSendToServer(string2long(value)); return true;
        default: return false;
    }
}

const char *TrafficSourceControlMessageDescriptor::getFieldStructName(void *object, int field) const
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

void *TrafficSourceControlMessageDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    TrafficSourceControlMessage *pp = (TrafficSourceControlMessage *)object; (void)pp;
    switch (field) {
        default: return NULL;
    }
}


