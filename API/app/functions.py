
# FUNKTIO: LÖYDÄ OIKEAT TIMESLOTIT
def findOptimalSlots(participants):
    # lasketaan henkilöt per slotti
    slotCount = {}
    
    for p in participants:
        for slot in p["preferredSlots"]:
                if slot not in slotCount:
                    slotCount[slot] = []
                slotCount[slot].append(p["name"])

    # etsitään slotti joka käy mahdollisimman monelle
    maxCount = max(len(names) for names in slotCount.values())
    optimislotti = {
        slot: names for slot, names in slotCount.items()
        if len(names) == maxCount
    }
    
    return {"optimislotti": optimislotti, "maxCount":maxCount}