//
// Generated file, do not edit! Created by opp_msgc 4.3 from model/node/applicationLayer/messageApplication/UpdateSendingRateMessage.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "UpdateSendingRateMessage_m.h"

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




Register_Class(UpdateSendingRateMessage);

UpdateSendingRateMessage::UpdateSendingRateMessage(const char *name, int kind) : ControlMessage(name,kind)
{
    this->setType(UPDATE_SENDING_RATE_MSG);

    this->sendingRate_var = 0;
}

UpdateSendingRateMessage::UpdateSendingRateMessage(const UpdateSendingRateMessage& other) : ControlMessage(other)
{
    copy(other);
}

UpdateSendingRateMessage::~UpdateSendingRateMessage()
{
}

UpdateSendingRateMessage& UpdateSendingRateMessage::operator=(const UpdateSendingRateMessage& other)
{
    if (this==&other) return *this;
    ControlMessage::operator=(other);
    copy(other);
    return *this;
}

void UpdateSendingRateMessage::copy(const UpdateSendingRateMessage& other)
{
    this->sendingRate_var = other.sendingRate_var;
}

void UpdateSendingRateMessage::parsimPack(cCommBuffer *b)
{
    ControlMessage::parsimPack(b);
    doPacking(b,this->sendingRate_var);
}

void UpdateSendingRateMessage::parsimUnpack(cCommBuffer *b)
{
    ControlMessage::parsimUnpack(b);
    doUnpacking(b,this->sendingRate_var);
}

double UpdateSendingRateMessage::getSendingRate() const
{
    return sendingRate_var;
}

void UpdateSendingRateMessage::setSendingRate(double sendingRate)
{
    this->sendingRate_var = sendingRate;
}

class UpdateSendingRateMessageDescriptor : public cClassDescriptor
{
  public:
    UpdateSendingRateMessageDescriptor();
    virtual ~UpdateSendingRateMessageDescriptor();

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

Register_ClassDescriptor(UpdateSendingRateMessageDescriptor);

UpdateSendingRateMessageDescriptor::UpdateSendingRateMessageDescriptor() : cClassDescriptor("UpdateSendingRateMessage", "ControlMessage")
{
}

UpdateSendingRateMessageDescriptor::~UpdateSendingRateMessageDescriptor()
{
}

bool UpdateSendingRateMessageDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<UpdateSendingRateMessage *>(obj)!=NULL;
}

const char *UpdateSendingRateMessageDescriptor::getProperty(const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int UpdateSendingRateMessageDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 1+basedesc->getFieldCount(object) : 1;
}

unsigned int UpdateSendingRateMessageDescriptor::getFieldTypeFlags(void *object, int field) const
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

const char *UpdateSendingRateMessageDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "sendingRate",
    };
    return (field>=0 && field<1) ? fieldNames[field] : NULL;
}

int UpdateSendingRateMessageDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='s' && strcmp(fieldName, "sendingRate")==0) return base+0;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *UpdateSendingRateMessageDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "double",
    };
    return (field>=0 && field<1) ? fieldTypeStrings[field] : NULL;
}

const char *UpdateSendingRateMessageDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
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

int UpdateSendingRateMessageDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    UpdateSendingRateMessage *pp = (UpdateSendingRateMessage *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string UpdateSendingRateMessageDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    UpdateSendingRateMessage *pp = (UpdateSendingRateMessage *)object; (void)pp;
    switch (field) {
        case 0: return double2string(pp->getSendingRate());
        default: return "";
    }
}

bool UpdateSendingRateMessageDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    UpdateSendingRateMessage *pp = (UpdateSendingRateMessage *)object; (void)pp;
    switch (field) {
        case 0: pp->setSendingRate(string2double(value)); return true;
        default: return false;
    }
}

const char *UpdateSendingRateMessageDescriptor::getFieldStructName(void *object, int field) const
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

void *UpdateSendingRateMessageDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    UpdateSendingRateMessage *pp = (UpdateSendingRateMessage *)object; (void)pp;
    switch (field) {
        default: return NULL;
    }
}


